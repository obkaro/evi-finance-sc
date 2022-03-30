import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'budget_categories_record.g.dart';

abstract class BudgetCategoriesRecord
    implements Built<BudgetCategoriesRecord, BudgetCategoriesRecordBuilder> {
  static Serializer<BudgetCategoriesRecord> get serializer =>
      _$budgetCategoriesRecordSerializer;

  @nullable
  String get categoryName;

  @nullable
  DocumentReference get categoryBudget;

  @nullable
  int get allocatedAmount;

  @nullable
  int get spentAmount;

  @nullable
  DocumentReference get budgetOwner;

  @nullable
  BuiltList<DocumentReference> get linkedTransactions;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BudgetCategoriesRecordBuilder builder) =>
      builder
        ..categoryName = ''
        ..allocatedAmount = 0
        ..spentAmount = 0
        ..linkedTransactions = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('budgetCategories');

  static Stream<BudgetCategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BudgetCategoriesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  BudgetCategoriesRecord._();
  factory BudgetCategoriesRecord(
          [void Function(BudgetCategoriesRecordBuilder) updates]) =
      _$BudgetCategoriesRecord;

  static BudgetCategoriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBudgetCategoriesRecordData({
  String categoryName,
  DocumentReference categoryBudget,
  int allocatedAmount,
  int spentAmount,
  DocumentReference budgetOwner,
}) =>
    serializers.toFirestore(
        BudgetCategoriesRecord.serializer,
        BudgetCategoriesRecord((b) => b
          ..categoryName = categoryName
          ..categoryBudget = categoryBudget
          ..allocatedAmount = allocatedAmount
          ..spentAmount = spentAmount
          ..budgetOwner = budgetOwner
          ..linkedTransactions = null));
