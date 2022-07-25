import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'const_institution_logos_record.g.dart';

abstract class ConstInstitutionLogosRecord
    implements
        Built<ConstInstitutionLogosRecord, ConstInstitutionLogosRecordBuilder> {
  static Serializer<ConstInstitutionLogosRecord> get serializer =>
      _$constInstitutionLogosRecordSerializer;

  String? get institutionName;

  String? get institutionLogo;

  String? get institutionCode;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ConstInstitutionLogosRecordBuilder builder) =>
      builder
        ..institutionName = ''
        ..institutionLogo = ''
        ..institutionCode = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('constInstitutionLogos');

  static Stream<ConstInstitutionLogosRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ConstInstitutionLogosRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ConstInstitutionLogosRecord._();
  factory ConstInstitutionLogosRecord(
          [void Function(ConstInstitutionLogosRecordBuilder) updates]) =
      _$ConstInstitutionLogosRecord;

  static ConstInstitutionLogosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createConstInstitutionLogosRecordData({
  String? institutionName,
  String? institutionLogo,
  String? institutionCode,
}) {
  final firestoreData = serializers.toFirestore(
    ConstInstitutionLogosRecord.serializer,
    ConstInstitutionLogosRecord(
      (c) => c
        ..institutionName = institutionName
        ..institutionLogo = institutionLogo
        ..institutionCode = institutionCode,
    ),
  );

  return firestoreData;
}
