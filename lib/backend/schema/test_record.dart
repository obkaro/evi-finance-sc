import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'test_record.g.dart';

abstract class TestRecord implements Built<TestRecord, TestRecordBuilder> {
  static Serializer<TestRecord> get serializer => _$testRecordSerializer;

  @nullable
  String get auth;

  @nullable
  String get masdf;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TestRecordBuilder builder) => builder
    ..auth = ''
    ..masdf = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Test');

  static Stream<TestRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TestRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TestRecord._();
  factory TestRecord([void Function(TestRecordBuilder) updates]) = _$TestRecord;

  static TestRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTestRecordData({
  String auth,
  String masdf,
}) =>
    serializers.toFirestore(
        TestRecord.serializer,
        TestRecord((t) => t
          ..auth = auth
          ..masdf = masdf));
