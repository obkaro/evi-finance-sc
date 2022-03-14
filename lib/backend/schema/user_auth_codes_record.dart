import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_auth_codes_record.g.dart';

abstract class UserAuthCodesRecord
    implements Built<UserAuthCodesRecord, UserAuthCodesRecordBuilder> {
  static Serializer<UserAuthCodesRecord> get serializer =>
      _$userAuthCodesRecordSerializer;

  @nullable
  DocumentReference get user;

  @nullable
  String get authCode;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UserAuthCodesRecordBuilder builder) =>
      builder..authCode = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userAuthCodes');

  static Stream<UserAuthCodesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UserAuthCodesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  UserAuthCodesRecord._();
  factory UserAuthCodesRecord(
          [void Function(UserAuthCodesRecordBuilder) updates]) =
      _$UserAuthCodesRecord;

  static UserAuthCodesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUserAuthCodesRecordData({
  DocumentReference user,
  String authCode,
}) =>
    serializers.toFirestore(
        UserAuthCodesRecord.serializer,
        UserAuthCodesRecord((u) => u
          ..user = user
          ..authCode = authCode));
