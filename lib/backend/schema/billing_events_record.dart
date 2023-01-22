import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'billing_events_record.g.dart';

abstract class BillingEventsRecord
    implements Built<BillingEventsRecord, BillingEventsRecordBuilder> {
  static Serializer<BillingEventsRecord> get serializer =>
      _$billingEventsRecordSerializer;

  String? get billingStatus;

  String? get id;

  String? get email;

  String? get username;

  DateTime? get timeCreated;

  String? get status;

  String? get txRef;

  String? get eventDate;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(BillingEventsRecordBuilder builder) => builder
    ..billingStatus = ''
    ..id = ''
    ..email = ''
    ..username = ''
    ..status = ''
    ..txRef = ''
    ..eventDate = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('billingEvents')
          : FirebaseFirestore.instance.collectionGroup('billingEvents');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('billingEvents').doc();

  static Stream<BillingEventsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BillingEventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BillingEventsRecord._();
  factory BillingEventsRecord(
          [void Function(BillingEventsRecordBuilder) updates]) =
      _$BillingEventsRecord;

  static BillingEventsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createBillingEventsRecordData({
  String? billingStatus,
  String? id,
  String? email,
  String? username,
  DateTime? timeCreated,
  String? status,
  String? txRef,
  String? eventDate,
}) {
  final firestoreData = serializers.toFirestore(
    BillingEventsRecord.serializer,
    BillingEventsRecord(
      (b) => b
        ..billingStatus = billingStatus
        ..id = id
        ..email = email
        ..username = username
        ..timeCreated = timeCreated
        ..status = status
        ..txRef = txRef
        ..eventDate = eventDate,
    ),
  );

  return firestoreData;
}
