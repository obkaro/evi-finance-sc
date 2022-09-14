import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'account_details_struct.g.dart';

abstract class AccountDetailsStruct
    implements Built<AccountDetailsStruct, AccountDetailsStructBuilder> {
  static Serializer<AccountDetailsStruct> get serializer =>
      _$accountDetailsStructSerializer;

  String? get logo;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(AccountDetailsStructBuilder builder) => builder
    ..logo = ''
    ..firestoreUtilData = FirestoreUtilData();

  AccountDetailsStruct._();
  factory AccountDetailsStruct(
          [void Function(AccountDetailsStructBuilder) updates]) =
      _$AccountDetailsStruct;
}

AccountDetailsStruct createAccountDetailsStruct({
  String? logo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AccountDetailsStruct(
      (a) => a
        ..logo = logo
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

AccountDetailsStruct? updateAccountDetailsStruct(
  AccountDetailsStruct? accountDetails, {
  bool clearUnsetFields = true,
}) =>
    accountDetails != null
        ? (accountDetails.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addAccountDetailsStructData(
  Map<String, dynamic> firestoreData,
  AccountDetailsStruct? accountDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (accountDetails == null) {
    return;
  }
  if (accountDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && accountDetails.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final accountDetailsData =
      getAccountDetailsFirestoreData(accountDetails, forFieldValue);
  final nestedData =
      accountDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = accountDetails.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getAccountDetailsFirestoreData(
  AccountDetailsStruct? accountDetails, [
  bool forFieldValue = false,
]) {
  if (accountDetails == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(AccountDetailsStruct.serializer, accountDetails);

  // Add any Firestore field values
  accountDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAccountDetailsListFirestoreData(
  List<AccountDetailsStruct>? accountDetailss,
) =>
    accountDetailss
        ?.map((a) => getAccountDetailsFirestoreData(a, true))
        .toList() ??
    [];
