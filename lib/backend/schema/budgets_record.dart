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
  bool get isRecurring;

  @nullable
  DocumentReference get uncategorizedLink;

  @nullable
  String get budgetID;

  @nullable
  DateTime get lastViewed;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BudgetsRecordBuilder builder) => builder
    ..budgetName = ''
    ..budgetAmount = 0
    ..budgetDescription = ''
    ..budgetLinkedAccounts = ListBuilder()
    ..budgetSubCategories = ListBuilder()
    ..isRecurring = false
    ..budgetID = '';

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
  String budgetDescription,
  DateTime budgetStart,
  DateTime budgetEnd,
  DateTime budgetDateCreated,
  bool isRecurring,
  DocumentReference uncategorizedLink,
  String budgetID,
  DateTime lastViewed,
}) =>
    serializers.toFirestore(
        BudgetsRecord.serializer,
        BudgetsRecord((b) => b
          ..budgetName = budgetName
          ..budgetOwner = budgetOwner
          ..budgetAmount = budgetAmount
          ..budgetDescription = budgetDescription
          ..budgetStart = budgetStart
          ..budgetEnd = budgetEnd
          ..budgetDateCreated = budgetDateCreated
          ..budgetLinkedAccounts = null
          ..budgetSubCategories = null
          ..isRecurring = isRecurring
          ..uncategorizedLink = uncategorizedLink
          ..budgetID = budgetID
          ..lastViewed = lastViewed));
