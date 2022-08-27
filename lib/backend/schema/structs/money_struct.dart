import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'money_struct.g.dart';

abstract class MoneyStruct implements Built<MoneyStruct, MoneyStructBuilder> {
  static Serializer<MoneyStruct> get serializer => _$moneyStructSerializer;

  String? get currency;

  String? get symbol;

  int? get amount;

  int? get converter;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(MoneyStructBuilder builder) => builder
    ..currency = ''
    ..symbol = ''
    ..amount = 0
    ..converter = 0
    ..firestoreUtilData = FirestoreUtilData();

  MoneyStruct._();
  factory MoneyStruct([void Function(MoneyStructBuilder) updates]) =
      _$MoneyStruct;
}

MoneyStruct createMoneyStruct({
  String? currency,
  String? symbol,
  int? amount,
  int? converter,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MoneyStruct(
      (m) => m
        ..currency = currency
        ..symbol = symbol
        ..amount = amount
        ..converter = converter
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

MoneyStruct? updateMoneyStruct(
  MoneyStruct? money, {
  bool clearUnsetFields = true,
}) =>
    money != null
        ? (money.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addMoneyStructData(
  Map<String, dynamic> firestoreData,
  MoneyStruct? money,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (money == null) {
    return;
  }
  if (money.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && money.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final moneyData = getMoneyFirestoreData(money, forFieldValue);
  final nestedData = moneyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = money.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getMoneyFirestoreData(
  MoneyStruct? money, [
  bool forFieldValue = false,
]) {
  if (money == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(MoneyStruct.serializer, money);

  // Add any Firestore field values
  money.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMoneyListFirestoreData(
  List<MoneyStruct>? moneys,
) =>
    moneys?.map((m) => getMoneyFirestoreData(m, true)).toList() ?? [];
