import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'versions_record.g.dart';

abstract class VersionsRecord
    implements Built<VersionsRecord, VersionsRecordBuilder> {
  static Serializer<VersionsRecord> get serializer =>
      _$versionsRecordSerializer;

  String? get platform;

  DateTime? get releaseDate;

  bool? get forceUpdate;

  String? get releaseNotes;

  String? get versionNumberString;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(VersionsRecordBuilder builder) => builder
    ..platform = ''
    ..forceUpdate = false
    ..releaseNotes = ''
    ..versionNumberString = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('versions');

  static Stream<VersionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<VersionsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  VersionsRecord._();
  factory VersionsRecord([void Function(VersionsRecordBuilder) updates]) =
      _$VersionsRecord;

  static VersionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createVersionsRecordData({
  String? platform,
  DateTime? releaseDate,
  bool? forceUpdate,
  String? releaseNotes,
  String? versionNumberString,
}) {
  final firestoreData = serializers.toFirestore(
    VersionsRecord.serializer,
    VersionsRecord(
      (v) => v
        ..platform = platform
        ..releaseDate = releaseDate
        ..forceUpdate = forceUpdate
        ..releaseNotes = releaseNotes
        ..versionNumberString = versionNumberString,
    ),
  );

  return firestoreData;
}
