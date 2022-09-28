import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'income_details_struct.g.dart';

abstract class IncomeDetailsStruct
    implements Built<IncomeDetailsStruct, IncomeDetailsStructBuilder> {
  static Serializer<IncomeDetailsStruct> get serializer =>
      _$incomeDetailsStructSerializer;

  String? get name;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(IncomeDetailsStructBuilder builder) => builder
    ..name = ''
    ..firestoreUtilData = FirestoreUtilData();

  IncomeDetailsStruct._();
  factory IncomeDetailsStruct(
          [void Function(IncomeDetailsStructBuilder) updates]) =
      _$IncomeDetailsStruct;
}

IncomeDetailsStruct createIncomeDetailsStruct({
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IncomeDetailsStruct(
      (i) => i
        ..name = name
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

IncomeDetailsStruct? updateIncomeDetailsStruct(
  IncomeDetailsStruct? incomeDetails, {
  bool clearUnsetFields = true,
}) =>
    incomeDetails != null
        ? (incomeDetails.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addIncomeDetailsStructData(
  Map<String, dynamic> firestoreData,
  IncomeDetailsStruct? incomeDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (incomeDetails == null) {
    return;
  }
  if (incomeDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && incomeDetails.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final incomeDetailsData =
      getIncomeDetailsFirestoreData(incomeDetails, forFieldValue);
  final nestedData =
      incomeDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = incomeDetails.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getIncomeDetailsFirestoreData(
  IncomeDetailsStruct? incomeDetails, [
  bool forFieldValue = false,
]) {
  if (incomeDetails == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(IncomeDetailsStruct.serializer, incomeDetails);

  // Add any Firestore field values
  incomeDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIncomeDetailsListFirestoreData(
  List<IncomeDetailsStruct>? incomeDetailss,
) =>
    incomeDetailss
        ?.map((i) => getIncomeDetailsFirestoreData(i, true))
        .toList() ??
    [];
