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
  double get accountBalance;

  @nullable
  DocumentReference get accountOwner;

  @nullable
  String get dataStatus;

  @nullable
  double get accountNumber;

  @nullable
  String get accountType;

  @nullable
  int get bankCode;

  @nullable
  String get institutionType;

  @nullable
  String get authMethod;

  @nullable
  double get bvn;

  @nullable
  String get currency;

  @nullable
  String get id;

  @nullable
  String get authID;

  @nullable
  String get institutionName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AccountsRecordBuilder builder) => builder
    ..accountName = ''
    ..accountBalance = 0.0
    ..dataStatus = ''
    ..accountNumber = 0.0
    ..accountType = ''
    ..bankCode = 0
    ..institutionType = ''
    ..authMethod = ''
    ..bvn = 0.0
    ..currency = ''
    ..id = ''
    ..authID = ''
    ..institutionName = '';

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
  double accountBalance,
  DocumentReference accountOwner,
  String dataStatus,
  double accountNumber,
  String accountType,
  int bankCode,
  String institutionType,
  String authMethod,
  double bvn,
  String currency,
  String id,
  String authID,
  String institutionName,
}) =>
    serializers.toFirestore(
        AccountsRecord.serializer,
        AccountsRecord((a) => a
          ..accountName = accountName
          ..accountBalance = accountBalance
          ..accountOwner = accountOwner
          ..dataStatus = dataStatus
          ..accountNumber = accountNumber
          ..accountType = accountType
          ..bankCode = bankCode
          ..institutionType = institutionType
          ..authMethod = authMethod
          ..bvn = bvn
          ..currency = currency
          ..id = id
          ..authID = authID
          ..institutionName = institutionName));
