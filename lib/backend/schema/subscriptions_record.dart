import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'subscriptions_record.g.dart';

abstract class SubscriptionsRecord
    implements Built<SubscriptionsRecord, SubscriptionsRecordBuilder> {
  static Serializer<SubscriptionsRecord> get serializer =>
      _$subscriptionsRecordSerializer;

  DocumentReference? get owner;

  String? get name;

  String? get icon;

  BuiltList<String>? get narrations;

  DateTime? get lastChargeDate;

  DateTime? get expChargeDate;

  DocumentReference? get category;

  MoneyStruct get lastCharge;

  MoneyStruct get expCharge;

  BuiltList<DocumentReference>? get transactions;

  bool? get notification;

  String? get recurrence;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SubscriptionsRecordBuilder builder) => builder
    ..name = ''
    ..icon = ''
    ..narrations = ListBuilder()
    ..lastCharge = MoneyStructBuilder()
    ..expCharge = MoneyStructBuilder()
    ..transactions = ListBuilder()
    ..notification = false
    ..recurrence = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subscriptions');

  static Stream<SubscriptionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SubscriptionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SubscriptionsRecord._();
  factory SubscriptionsRecord(
          [void Function(SubscriptionsRecordBuilder) updates]) =
      _$SubscriptionsRecord;

  static SubscriptionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSubscriptionsRecordData({
  DocumentReference? owner,
  String? name,
  String? icon,
  DateTime? lastChargeDate,
  DateTime? expChargeDate,
  DocumentReference? category,
  MoneyStruct? lastCharge,
  MoneyStruct? expCharge,
  bool? notification,
  String? recurrence,
}) {
  final firestoreData = serializers.toFirestore(
    SubscriptionsRecord.serializer,
    SubscriptionsRecord(
      (s) => s
        ..owner = owner
        ..name = name
        ..icon = icon
        ..narrations = null
        ..lastChargeDate = lastChargeDate
        ..expChargeDate = expChargeDate
        ..category = category
        ..lastCharge = MoneyStructBuilder()
        ..expCharge = MoneyStructBuilder()
        ..transactions = null
        ..notification = notification
        ..recurrence = recurrence,
    ),
  );

  // Handle nested data for "lastCharge" field.
  addMoneyStructData(firestoreData, lastCharge, 'lastCharge');

  // Handle nested data for "expCharge" field.
  addMoneyStructData(firestoreData, expCharge, 'expCharge');

  return firestoreData;
}
