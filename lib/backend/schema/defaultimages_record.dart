import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'defaultimages_record.g.dart';

abstract class DefaultimagesRecord
    implements Built<DefaultimagesRecord, DefaultimagesRecordBuilder> {
  static Serializer<DefaultimagesRecord> get serializer =>
      _$defaultimagesRecordSerializer;

  String? get imageurl;

  String? get name;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DefaultimagesRecordBuilder builder) => builder
    ..imageurl = ''
    ..name = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('defaultimages');

  static Stream<DefaultimagesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DefaultimagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DefaultimagesRecord._();
  factory DefaultimagesRecord(
          [void Function(DefaultimagesRecordBuilder) updates]) =
      _$DefaultimagesRecord;

  static DefaultimagesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDefaultimagesRecordData({
  String? imageurl,
  String? name,
}) {
  final firestoreData = serializers.toFirestore(
    DefaultimagesRecord.serializer,
    DefaultimagesRecord(
      (d) => d
        ..imageurl = imageurl
        ..name = name,
    ),
  );

  return firestoreData;
}
