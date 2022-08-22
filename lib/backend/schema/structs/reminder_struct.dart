import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'reminder_struct.g.dart';

abstract class ReminderStruct
    implements Built<ReminderStruct, ReminderStructBuilder> {
  static Serializer<ReminderStruct> get serializer =>
      _$reminderStructSerializer;

  DateTime? get lastDate;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(ReminderStructBuilder builder) =>
      builder..firestoreUtilData = FirestoreUtilData();

  ReminderStruct._();
  factory ReminderStruct([void Function(ReminderStructBuilder) updates]) =
      _$ReminderStruct;
}

ReminderStruct createReminderStruct({
  DateTime? lastDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ReminderStruct(
      (r) => r
        ..lastDate = lastDate
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

ReminderStruct? updateReminderStruct(
  ReminderStruct? reminder, {
  bool clearUnsetFields = true,
}) =>
    reminder != null
        ? (reminder.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addReminderStructData(
  Map<String, dynamic> firestoreData,
  ReminderStruct? reminder,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (reminder == null) {
    return;
  }
  if (reminder.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && reminder.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final reminderData = getReminderFirestoreData(reminder, forFieldValue);
  final nestedData = reminderData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = reminder.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getReminderFirestoreData(
  ReminderStruct? reminder, [
  bool forFieldValue = false,
]) {
  if (reminder == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(ReminderStruct.serializer, reminder);

  // Add any Firestore field values
  reminder.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getReminderListFirestoreData(
  List<ReminderStruct>? reminders,
) =>
    reminders?.map((r) => getReminderFirestoreData(r, true)).toList() ?? [];
