import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'category_details_struct.g.dart';

abstract class CategoryDetailsStruct
    implements Built<CategoryDetailsStruct, CategoryDetailsStructBuilder> {
  static Serializer<CategoryDetailsStruct> get serializer =>
      _$categoryDetailsStructSerializer;

  String? get name;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(CategoryDetailsStructBuilder builder) =>
      builder
        ..name = ''
        ..firestoreUtilData = FirestoreUtilData();

  CategoryDetailsStruct._();
  factory CategoryDetailsStruct(
          [void Function(CategoryDetailsStructBuilder) updates]) =
      _$CategoryDetailsStruct;
}

CategoryDetailsStruct createCategoryDetailsStruct({
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CategoryDetailsStruct(
      (c) => c
        ..name = name
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

CategoryDetailsStruct? updateCategoryDetailsStruct(
  CategoryDetailsStruct? categoryDetails, {
  bool clearUnsetFields = true,
}) =>
    categoryDetails != null
        ? (categoryDetails.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addCategoryDetailsStructData(
  Map<String, dynamic> firestoreData,
  CategoryDetailsStruct? categoryDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (categoryDetails == null) {
    return;
  }
  if (categoryDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && categoryDetails.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final categoryDetailsData =
      getCategoryDetailsFirestoreData(categoryDetails, forFieldValue);
  final nestedData =
      categoryDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = categoryDetails.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getCategoryDetailsFirestoreData(
  CategoryDetailsStruct? categoryDetails, [
  bool forFieldValue = false,
]) {
  if (categoryDetails == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(
      CategoryDetailsStruct.serializer, categoryDetails);

  // Add any Firestore field values
  categoryDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCategoryDetailsListFirestoreData(
  List<CategoryDetailsStruct>? categoryDetailss,
) =>
    categoryDetailss
        ?.map((c) => getCategoryDetailsFirestoreData(c, true))
        .toList() ??
    [];
