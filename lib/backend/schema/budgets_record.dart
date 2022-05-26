import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'budgets_record.g.dart';

abstract class BudgetsRecord
    implements Built<BudgetsRecord, BudgetsRecordBuilder> {
  static Serializer<BudgetsRecord> get serializer => _$budgetsRecordSerializer;

  @nullable
  DocumentReference get budgetOwner;

  @nullable
  int get budgetAmount;

  @nullable
  DateTime get budgetStart;

  @nullable
  DateTime get budgetEnd;

  @nullable
  DateTime get budgetDateCreated;

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
  bool get isActive;

  @nullable
  String get budgetDuration;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BudgetsRecordBuilder builder) => builder
    ..budgetAmount = 0
    ..budgetSubCategories = ListBuilder()
    ..isRecurring = false
    ..budgetID = ''
    ..isActive = false
    ..budgetDuration = '';

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
  DocumentReference budgetOwner,
  int budgetAmount,
  DateTime budgetStart,
  DateTime budgetEnd,
  DateTime budgetDateCreated,
  bool isRecurring,
  DocumentReference uncategorizedLink,
  String budgetID,
  DateTime lastViewed,
  bool isActive,
  String budgetDuration,
}) =>
    serializers.toFirestore(
        BudgetsRecord.serializer,
        BudgetsRecord((b) => b
          ..budgetOwner = budgetOwner
          ..budgetAmount = budgetAmount
          ..budgetStart = budgetStart
          ..budgetEnd = budgetEnd
          ..budgetDateCreated = budgetDateCreated
          ..budgetSubCategories = null
          ..isRecurring = isRecurring
          ..uncategorizedLink = uncategorizedLink
          ..budgetID = budgetID
          ..lastViewed = lastViewed
          ..isActive = isActive
          ..budgetDuration = budgetDuration));
