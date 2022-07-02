import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'budget_categories_record.g.dart';

abstract class BudgetCategoriesRecord
    implements Built<BudgetCategoriesRecord, BudgetCategoriesRecordBuilder> {
  static Serializer<BudgetCategoriesRecord> get serializer =>
      _$budgetCategoriesRecordSerializer;

  String? get categoryName;

  DocumentReference? get categoryBudget;

  int? get allocatedAmount;

  DocumentReference? get budgetOwner;

  BuiltList<DocumentReference>? get linkedTransactions;

  String? get categoryID;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ref;
  DocumentReference get reference => ref!;

  static void _initializeBuilder(BudgetCategoriesRecordBuilder builder) =>
      builder
        ..categoryName = ''
        ..allocatedAmount = 0
        ..linkedTransactions = ListBuilder()
        ..categoryID = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('budgetCategories');

  static Stream<BudgetCategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BudgetCategoriesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BudgetCategoriesRecord._();
  factory BudgetCategoriesRecord(
          [void Function(BudgetCategoriesRecordBuilder) updates]) =
      _$BudgetCategoriesRecord;

  static BudgetCategoriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createBudgetCategoriesRecordData({
  String? categoryName,
  DocumentReference? categoryBudget,
  int? allocatedAmount,
  DocumentReference? budgetOwner,
  String? categoryID,
}) =>
    serializers.toFirestore(
        BudgetCategoriesRecord.serializer,
        BudgetCategoriesRecord((b) => b
          ..categoryName = categoryName
          ..categoryBudget = categoryBudget
          ..allocatedAmount = allocatedAmount
          ..budgetOwner = budgetOwner
          ..linkedTransactions = null
          ..categoryID = categoryID));
