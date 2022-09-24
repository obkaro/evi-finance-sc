import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'budgets_record.g.dart';

abstract class BudgetsRecord
    implements Built<BudgetsRecord, BudgetsRecordBuilder> {
  static Serializer<BudgetsRecord> get serializer => _$budgetsRecordSerializer;

  DocumentReference? get budgetOwner;

  int? get budgetAmount;

  DateTime? get budgetStart;

  DateTime? get budgetEnd;

  DateTime? get budgetDateCreated;

  bool? get isRecurring;

  String? get budgetID;

  String? get budgetDuration;

  int? get unallocatedAmount;

  String? get status;

  int? get duration;

  int? get budgetSpent;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(BudgetsRecordBuilder builder) => builder
    ..budgetAmount = 0
    ..isRecurring = false
    ..budgetID = ''
    ..budgetDuration = ''
    ..unallocatedAmount = 0
    ..status = ''
    ..duration = 0
    ..budgetSpent = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('budgets');

  static Stream<BudgetsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BudgetsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BudgetsRecord._();
  factory BudgetsRecord([void Function(BudgetsRecordBuilder) updates]) =
      _$BudgetsRecord;

  static BudgetsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createBudgetsRecordData({
  DocumentReference? budgetOwner,
  int? budgetAmount,
  DateTime? budgetStart,
  DateTime? budgetEnd,
  DateTime? budgetDateCreated,
  bool? isRecurring,
  String? budgetID,
  String? budgetDuration,
  int? unallocatedAmount,
  String? status,
  int? duration,
  int? budgetSpent,
}) {
  final firestoreData = serializers.toFirestore(
    BudgetsRecord.serializer,
    BudgetsRecord(
      (b) => b
        ..budgetOwner = budgetOwner
        ..budgetAmount = budgetAmount
        ..budgetStart = budgetStart
        ..budgetEnd = budgetEnd
        ..budgetDateCreated = budgetDateCreated
        ..isRecurring = isRecurring
        ..budgetID = budgetID
        ..budgetDuration = budgetDuration
        ..unallocatedAmount = unallocatedAmount
        ..status = status
        ..duration = duration
        ..budgetSpent = budgetSpent,
    ),
  );

  return firestoreData;
}
