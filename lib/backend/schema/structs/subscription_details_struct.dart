import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'subscription_details_struct.g.dart';

abstract class SubscriptionDetailsStruct
    implements
        Built<SubscriptionDetailsStruct, SubscriptionDetailsStructBuilder> {
  static Serializer<SubscriptionDetailsStruct> get serializer =>
      _$subscriptionDetailsStructSerializer;

  String? get name;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(SubscriptionDetailsStructBuilder builder) =>
      builder
        ..name = ''
        ..firestoreUtilData = FirestoreUtilData();

  SubscriptionDetailsStruct._();
  factory SubscriptionDetailsStruct(
          [void Function(SubscriptionDetailsStructBuilder) updates]) =
      _$SubscriptionDetailsStruct;
}

SubscriptionDetailsStruct createSubscriptionDetailsStruct({
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SubscriptionDetailsStruct(
      (s) => s
        ..name = name
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

SubscriptionDetailsStruct? updateSubscriptionDetailsStruct(
  SubscriptionDetailsStruct? subscriptionDetails, {
  bool clearUnsetFields = true,
}) =>
    subscriptionDetails != null
        ? (subscriptionDetails.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addSubscriptionDetailsStructData(
  Map<String, dynamic> firestoreData,
  SubscriptionDetailsStruct? subscriptionDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (subscriptionDetails == null) {
    return;
  }
  if (subscriptionDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue &&
      subscriptionDetails.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final subscriptionDetailsData =
      getSubscriptionDetailsFirestoreData(subscriptionDetails, forFieldValue);
  final nestedData =
      subscriptionDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = subscriptionDetails.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getSubscriptionDetailsFirestoreData(
  SubscriptionDetailsStruct? subscriptionDetails, [
  bool forFieldValue = false,
]) {
  if (subscriptionDetails == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(
      SubscriptionDetailsStruct.serializer, subscriptionDetails);

  // Add any Firestore field values
  subscriptionDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSubscriptionDetailsListFirestoreData(
  List<SubscriptionDetailsStruct>? subscriptionDetailss,
) =>
    subscriptionDetailss
        ?.map((s) => getSubscriptionDetailsFirestoreData(s, true))
        .toList() ??
    [];
