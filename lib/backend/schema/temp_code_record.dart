import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'temp_code_record.g.dart';

abstract class TempCodeRecord
    implements Built<TempCodeRecord, TempCodeRecordBuilder> {
  static Serializer<TempCodeRecord> get serializer =>
      _$tempCodeRecordSerializer;

  @nullable
  DocumentReference get user;

  @nullable
  String get code;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TempCodeRecordBuilder builder) =>
      builder..code = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tempCode');

  static Stream<TempCodeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TempCodeRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TempCodeRecord._();
  factory TempCodeRecord([void Function(TempCodeRecordBuilder) updates]) =
      _$TempCodeRecord;

  static TempCodeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTempCodeRecordData({
  DocumentReference user,
  String code,
}) =>
    serializers.toFirestore(
        TempCodeRecord.serializer,
        TempCodeRecord((t) => t
          ..user = user
          ..code = code));
