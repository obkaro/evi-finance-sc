import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'payment_info_record.g.dart';

abstract class PaymentInfoRecord
    implements Built<PaymentInfoRecord, PaymentInfoRecordBuilder> {
  static Serializer<PaymentInfoRecord> get serializer =>
      _$paymentInfoRecordSerializer;

  String? get payStatus;

  String? get email;

  String? get username;

  String? get planId;

  String? get ownerId;

  DateTime? get expireDate;

  DateTime? get firstPurchaseDate;

  DateTime? get lastPayment;

  String? get paymentUrl;

  String? get billingEventId;

  String? get subscriptionId;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(PaymentInfoRecordBuilder builder) => builder
    ..payStatus = ''
    ..email = ''
    ..username = ''
    ..planId = ''
    ..ownerId = ''
    ..paymentUrl = ''
    ..billingEventId = ''
    ..subscriptionId = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('paymentInfo')
          : FirebaseFirestore.instance.collectionGroup('paymentInfo');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('paymentInfo').doc();

  static Stream<PaymentInfoRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PaymentInfoRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PaymentInfoRecord._();
  factory PaymentInfoRecord([void Function(PaymentInfoRecordBuilder) updates]) =
      _$PaymentInfoRecord;

  static PaymentInfoRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPaymentInfoRecordData({
  String? payStatus,
  String? email,
  String? username,
  String? planId,
  String? ownerId,
  DateTime? expireDate,
  DateTime? firstPurchaseDate,
  DateTime? lastPayment,
  String? paymentUrl,
  String? billingEventId,
  String? subscriptionId,
}) {
  final firestoreData = serializers.toFirestore(
    PaymentInfoRecord.serializer,
    PaymentInfoRecord(
      (p) => p
        ..payStatus = payStatus
        ..email = email
        ..username = username
        ..planId = planId
        ..ownerId = ownerId
        ..expireDate = expireDate
        ..firstPurchaseDate = firstPurchaseDate
        ..lastPayment = lastPayment
        ..paymentUrl = paymentUrl
        ..billingEventId = billingEventId
        ..subscriptionId = subscriptionId,
    ),
  );

  return firestoreData;
}
