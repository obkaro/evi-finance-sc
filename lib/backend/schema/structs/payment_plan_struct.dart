import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'payment_plan_struct.g.dart';

abstract class PaymentPlanStruct
    implements Built<PaymentPlanStruct, PaymentPlanStructBuilder> {
  static Serializer<PaymentPlanStruct> get serializer =>
      _$paymentPlanStructSerializer;

  String? get name;

  MoneyStruct get price;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(PaymentPlanStructBuilder builder) => builder
    ..name = ''
    ..price = MoneyStructBuilder()
    ..firestoreUtilData = FirestoreUtilData();

  PaymentPlanStruct._();
  factory PaymentPlanStruct([void Function(PaymentPlanStructBuilder) updates]) =
      _$PaymentPlanStruct;
}

PaymentPlanStruct createPaymentPlanStruct({
  String? name,
  MoneyStruct? price,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PaymentPlanStruct(
      (p) => p
        ..name = name
        ..price = price?.toBuilder() ?? MoneyStructBuilder()
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

PaymentPlanStruct? updatePaymentPlanStruct(
  PaymentPlanStruct? paymentPlan, {
  bool clearUnsetFields = true,
}) =>
    paymentPlan != null
        ? (paymentPlan.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addPaymentPlanStructData(
  Map<String, dynamic> firestoreData,
  PaymentPlanStruct? paymentPlan,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (paymentPlan == null) {
    return;
  }
  if (paymentPlan.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && paymentPlan.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final paymentPlanData =
      getPaymentPlanFirestoreData(paymentPlan, forFieldValue);
  final nestedData =
      paymentPlanData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = paymentPlan.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getPaymentPlanFirestoreData(
  PaymentPlanStruct? paymentPlan, [
  bool forFieldValue = false,
]) {
  if (paymentPlan == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(PaymentPlanStruct.serializer, paymentPlan);

  // Handle nested data for "price" field.
  addMoneyStructData(firestoreData, paymentPlan.price, 'price', forFieldValue);

  // Add any Firestore field values
  paymentPlan.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPaymentPlanListFirestoreData(
  List<PaymentPlanStruct>? paymentPlans,
) =>
    paymentPlans?.map((p) => getPaymentPlanFirestoreData(p, true)).toList() ??
    [];
