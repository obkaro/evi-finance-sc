import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'accounts_record.g.dart';

abstract class AccountsRecord
    implements Built<AccountsRecord, AccountsRecordBuilder> {
  static Serializer<AccountsRecord> get serializer =>
      _$accountsRecordSerializer;

  String? get accountName;

  DocumentReference? get accountOwner;

  String? get dataStatus;

  String? get accountType;

  String? get institutionType;

  String? get authMethod;

  String? get currency;

  String? get authID;

  String? get institutionName;

  int? get accountBalance;

  String? get bankCode;

  String? get accountNumber;

  String? get bvn;

  DateTime? get dateLinked;

  String? get accountLogo;

  bool? get reauthRequired;

  DateTime? get lastSync;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ref;
  DocumentReference get reference => ref!;

  static void _initializeBuilder(AccountsRecordBuilder builder) => builder
    ..accountName = ''
    ..dataStatus = ''
    ..accountType = ''
    ..institutionType = ''
    ..authMethod = ''
    ..currency = ''
    ..authID = ''
    ..institutionName = ''
    ..accountBalance = 0
    ..bankCode = ''
    ..accountNumber = ''
    ..bvn = ''
    ..accountLogo = ''
    ..reauthRequired = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('accounts');

  static Stream<AccountsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AccountsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AccountsRecord._();
  factory AccountsRecord([void Function(AccountsRecordBuilder) updates]) =
      _$AccountsRecord;

  static AccountsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAccountsRecordData({
  String? accountName,
  DocumentReference? accountOwner,
  String? dataStatus,
  String? accountType,
  String? institutionType,
  String? authMethod,
  String? currency,
  String? authID,
  String? institutionName,
  int? accountBalance,
  String? bankCode,
  String? accountNumber,
  String? bvn,
  DateTime? dateLinked,
  String? accountLogo,
  bool? reauthRequired,
  DateTime? lastSync,
}) =>
    serializers.toFirestore(
        AccountsRecord.serializer,
        AccountsRecord((a) => a
          ..accountName = accountName
          ..accountOwner = accountOwner
          ..dataStatus = dataStatus
          ..accountType = accountType
          ..institutionType = institutionType
          ..authMethod = authMethod
          ..currency = currency
          ..authID = authID
          ..institutionName = institutionName
          ..accountBalance = accountBalance
          ..bankCode = bankCode
          ..accountNumber = accountNumber
          ..bvn = bvn
          ..dateLinked = dateLinked
          ..accountLogo = accountLogo
          ..reauthRequired = reauthRequired
          ..lastSync = lastSync));
