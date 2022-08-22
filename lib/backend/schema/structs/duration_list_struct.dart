import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'duration_list_struct.g.dart';

abstract class DurationListStruct
    implements Built<DurationListStruct, DurationListStructBuilder> {
  static Serializer<DurationListStruct> get serializer =>
      _$durationListStructSerializer;

  BuiltList<DurationStruct> get list;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(DurationListStructBuilder builder) => builder
    ..list = ListBuilder()
    ..firestoreUtilData = FirestoreUtilData();

  DurationListStruct._();
  factory DurationListStruct(
          [void Function(DurationListStructBuilder) updates]) =
      _$DurationListStruct;
}

DurationListStruct createDurationListStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DurationListStruct(
      (d) => d
        ..list = null
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

DurationListStruct? updateDurationListStruct(
  DurationListStruct? durationList, {
  bool clearUnsetFields = true,
}) =>
    durationList != null
        ? (durationList.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addDurationListStructData(
  Map<String, dynamic> firestoreData,
  DurationListStruct? durationList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (durationList == null) {
    return;
  }
  if (durationList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && durationList.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final durationListData =
      getDurationListFirestoreData(durationList, forFieldValue);
  final nestedData =
      durationListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = durationList.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getDurationListFirestoreData(
  DurationListStruct? durationList, [
  bool forFieldValue = false,
]) {
  if (durationList == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(DurationListStruct.serializer, durationList);

  // Add any Firestore field values
  durationList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDurationListListFirestoreData(
  List<DurationListStruct>? durationLists,
) =>
    durationLists?.map((d) => getDurationListFirestoreData(d, true)).toList() ??
    [];
