import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'budgets_record.g.dart';

abstract class BudgetsRecord
    implements Built<BudgetsRecord, BudgetsRecordBuilder> {
  static Serializer<BudgetsRecord> get serializer => _$budgetsRecordSerializer;

  @nullable
  String get budgetName;

  @nullable
  DocumentReference get budgetOwner;

  @nullable
  int get budgetAmount;

  @nullable
  int get budgetSpent;

  @nullable
  String get budgetDescription;

  @nullable
  DateTime get budgetStart;

  @nullable
  DateTime get budgetEnd;

  @nullable
  DateTime get budgetDateCreated;

  @nullable
  BuiltList<DocumentReference> get budgetLinkedAccounts;

  @nullable
  BuiltList<DocumentReference> get budgetSubCategories;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BudgetsRecordBuilder builder) => builder
    ..budgetName = ''
    ..budgetAmount = 0
    ..budgetSpent = 0
    ..budgetDescription = ''
    ..budgetLinkedAccounts = ListBuilder()
    ..budgetSubCategories = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('budgets');

  static Stream<BudgetsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BudgetsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  BudgetsRecord._();
  factory BudgetsRecord([void Function(BudgetsRecordBuilder) updates]) =
      _$BudgetsRecord;

  static BudgetsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBudgetsRecordData({
  String budgetName,
  DocumentReference budgetOwner,
  int budgetAmount,
  int budgetSpent,
  String budgetDescription,
  DateTime budgetStart,
  DateTime budgetEnd,
  DateTime budgetDateCreated,
}) =>
    serializers.toFirestore(
        BudgetsRecord.serializer,
        BudgetsRecord((b) => b
          ..budgetName = budgetName
          ..budgetOwner = budgetOwner
          ..budgetAmount = budgetAmount
          ..budgetSpent = budgetSpent
          ..budgetDescription = budgetDescription
          ..budgetStart = budgetStart
          ..budgetEnd = budgetEnd
          ..budgetDateCreated = budgetDateCreated
          ..budgetLinkedAccounts = null
          ..budgetSubCategories = null));
