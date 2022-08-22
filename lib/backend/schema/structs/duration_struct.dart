import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'duration_struct.g.dart';

abstract class DurationStruct
    implements Built<DurationStruct, DurationStructBuilder> {
  static Serializer<DurationStruct> get serializer =>
      _$durationStructSerializer;

  String? get title;

  int? get length;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(DurationStructBuilder builder) => builder
    ..title = ''
    ..length = 0
    ..firestoreUtilData = FirestoreUtilData();

  DurationStruct._();
  factory DurationStruct([void Function(DurationStructBuilder) updates]) =
      _$DurationStruct;
}

DurationStruct createDurationStruct({
  String? title,
  int? length,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DurationStruct(
      (d) => d
        ..title = title
        ..length = length
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

DurationStruct? updateDurationStruct(
  DurationStruct? duration, {
  bool clearUnsetFields = true,
}) =>
    duration != null
        ? (duration.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addDurationStructData(
  Map<String, dynamic> firestoreData,
  DurationStruct? duration,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (duration == null) {
    return;
  }
  if (duration.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && duration.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final durationData = getDurationFirestoreData(duration, forFieldValue);
  final nestedData = durationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = duration.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getDurationFirestoreData(
  DurationStruct? duration, [
  bool forFieldValue = false,
]) {
  if (duration == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(DurationStruct.serializer, duration);

  // Add any Firestore field values
  duration.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDurationListFirestoreData(
  List<DurationStruct>? durations,
) =>
    durations?.map((d) => getDurationFirestoreData(d, true)).toList() ?? [];
