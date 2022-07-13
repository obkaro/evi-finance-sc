import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'const_budget_categories_record.g.dart';

abstract class ConstBudgetCategoriesRecord
    implements
        Built<ConstBudgetCategoriesRecord, ConstBudgetCategoriesRecordBuilder> {
  static Serializer<ConstBudgetCategoriesRecord> get serializer =>
      _$constBudgetCategoriesRecordSerializer;

  String? get categoryName;

  int? get categoryWeight;

  DocumentReference? get categoryOwner;

  String? get categoryIcon;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ConstBudgetCategoriesRecordBuilder builder) =>
      builder
        ..categoryName = ''
        ..categoryWeight = 0
        ..categoryIcon = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('constBudgetCategories');

  static Stream<ConstBudgetCategoriesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ConstBudgetCategoriesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ConstBudgetCategoriesRecord._();
  factory ConstBudgetCategoriesRecord(
          [void Function(ConstBudgetCategoriesRecordBuilder) updates]) =
      _$ConstBudgetCategoriesRecord;

  static ConstBudgetCategoriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createConstBudgetCategoriesRecordData({
  String? categoryName,
  int? categoryWeight,
  DocumentReference? categoryOwner,
  String? categoryIcon,
}) =>
    serializers.toFirestore(
        ConstBudgetCategoriesRecord.serializer,
        ConstBudgetCategoriesRecord((c) => c
          ..categoryName = categoryName
          ..categoryWeight = categoryWeight
          ..categoryOwner = categoryOwner
          ..categoryIcon = categoryIcon));
