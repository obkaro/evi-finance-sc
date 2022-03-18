import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'accounts_record.g.dart';

abstract class AccountsRecord
    implements Built<AccountsRecord, AccountsRecordBuilder> {
  static Serializer<AccountsRecord> get serializer =>
      _$accountsRecordSerializer;

  @nullable
  String get accountName;

  @nullable
  DocumentReference get accountOwner;

  @nullable
  String get dataStatus;

  @nullable
  String get accountType;

  @nullable
  int get bankCode;

  @nullable
  String get institutionType;

  @nullable
  String get authMethod;

  @nullable
  String get currency;

  @nullable
  String get authID;

  @nullable
  String get institutionName;

  @nullable
  int get accountBalance;

  @nullable
  int get accountNumber;

  @nullable
  int get bvn;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AccountsRecordBuilder builder) => builder
    ..accountName = ''
    ..dataStatus = ''
    ..accountType = ''
    ..bankCode = 0
    ..institutionType = ''
    ..authMethod = ''
    ..currency = ''
    ..authID = ''
    ..institutionName = ''
    ..accountBalance = 0
    ..accountNumber = 0
    ..bvn = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('accounts');

  static Stream<AccountsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<AccountsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AccountsRecord._();
  factory AccountsRecord([void Function(AccountsRecordBuilder) updates]) =
      _$AccountsRecord;

  static AccountsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAccountsRecordData({
  String accountName,
  DocumentReference accountOwner,
  String dataStatus,
  String accountType,
  int bankCode,
  String institutionType,
  String authMethod,
  String currency,
  String authID,
  String institutionName,
  int accountBalance,
  int accountNumber,
  int bvn,
}) =>
    serializers.toFirestore(
        AccountsRecord.serializer,
        AccountsRecord((a) => a
          ..accountName = accountName
          ..accountOwner = accountOwner
          ..dataStatus = dataStatus
          ..accountType = accountType
          ..bankCode = bankCode
          ..institutionType = institutionType
          ..authMethod = authMethod
          ..currency = currency
          ..authID = authID
          ..institutionName = institutionName
          ..accountBalance = accountBalance
          ..accountNumber = accountNumber
          ..bvn = bvn));
