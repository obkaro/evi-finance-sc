import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'const_merchants_record.g.dart';

abstract class ConstMerchantsRecord
    implements Built<ConstMerchantsRecord, ConstMerchantsRecordBuilder> {
  static Serializer<ConstMerchantsRecord> get serializer =>
      _$constMerchantsRecordSerializer;

  String? get name;

  String? get logo;

  BuiltList<String>? get tags;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ConstMerchantsRecordBuilder builder) => builder
    ..name = ''
    ..logo = ''
    ..tags = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('constMerchants');

  static Stream<ConstMerchantsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ConstMerchantsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ConstMerchantsRecord._();
  factory ConstMerchantsRecord(
          [void Function(ConstMerchantsRecordBuilder) updates]) =
      _$ConstMerchantsRecord;

  static ConstMerchantsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createConstMerchantsRecordData({
  String? name,
  String? logo,
}) {
  final firestoreData = serializers.toFirestore(
    ConstMerchantsRecord.serializer,
    ConstMerchantsRecord(
      (c) => c
        ..name = name
        ..logo = logo
        ..tags = null,
    ),
  );

  return firestoreData;
}
