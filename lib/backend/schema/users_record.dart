import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  double? get income;

  String? get tempAuthCode;

  BuiltList<DocumentReference>? get accountsList;

  BuiltList<DocumentReference>? get budgetList;

  DocumentReference? get activeBudget;

  DocumentReference? get defaultAccount;

  int? get onboardingStep;

  String? get experience;

  String? get username;

  @BuiltValueField(wireName: 'acq_channel')
  String? get acqChannel;

  DocumentReference? get paymentInfo;

  @BuiltValueField(wireName: 'sub_status')
  String? get subStatus;

  @BuiltValueField(wireName: 'next_payment_date')
  DateTime? get nextPaymentDate;

  DateTime? get lastActive;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..income = 0.0
    ..tempAuthCode = ''
    ..accountsList = ListBuilder()
    ..budgetList = ListBuilder()
    ..onboardingStep = 0
    ..experience = ''
    ..username = ''
    ..acqChannel = ''
    ..subStatus = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  double? income,
  String? tempAuthCode,
  DocumentReference? activeBudget,
  DocumentReference? defaultAccount,
  int? onboardingStep,
  String? experience,
  String? username,
  String? acqChannel,
  DocumentReference? paymentInfo,
  String? subStatus,
  DateTime? nextPaymentDate,
  DateTime? lastActive,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..income = income
        ..tempAuthCode = tempAuthCode
        ..accountsList = null
        ..budgetList = null
        ..activeBudget = activeBudget
        ..defaultAccount = defaultAccount
        ..onboardingStep = onboardingStep
        ..experience = experience
        ..username = username
        ..acqChannel = acqChannel
        ..paymentInfo = paymentInfo
        ..subStatus = subStatus
        ..nextPaymentDate = nextPaymentDate
        ..lastActive = lastActive,
    ),
  );

  return firestoreData;
}
