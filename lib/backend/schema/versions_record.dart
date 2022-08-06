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

  int? get versionNumber;

  bool? get forceUpdate;

  String? get releaseNotes;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(VersionsRecordBuilder builder) => builder
    ..platform = ''
    ..versionNumber = 0
    ..forceUpdate = false
    ..releaseNotes = '';

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
  int? versionNumber,
  bool? forceUpdate,
  String? releaseNotes,
}) {
  final firestoreData = serializers.toFirestore(
    VersionsRecord.serializer,
    VersionsRecord(
      (v) => v
        ..platform = platform
        ..releaseDate = releaseDate
        ..versionNumber = versionNumber
        ..forceUpdate = forceUpdate
        ..releaseNotes = releaseNotes,
    ),
  );

  return firestoreData;
}
