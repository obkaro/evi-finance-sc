import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'const_recurring_payments_record.g.dart';

abstract class ConstRecurringPaymentsRecord
    implements
        Built<ConstRecurringPaymentsRecord,
            ConstRecurringPaymentsRecordBuilder> {
  static Serializer<ConstRecurringPaymentsRecord> get serializer =>
      _$constRecurringPaymentsRecordSerializer;

  String? get name;

  String? get icon;

  BuiltList<PaymentPlanStruct>? get plans;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ConstRecurringPaymentsRecordBuilder builder) =>
      builder
        ..name = ''
        ..icon = ''
        ..plans = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('constRecurringPayments');

  static Stream<ConstRecurringPaymentsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ConstRecurringPaymentsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ConstRecurringPaymentsRecord._();
  factory ConstRecurringPaymentsRecord(
          [void Function(ConstRecurringPaymentsRecordBuilder) updates]) =
      _$ConstRecurringPaymentsRecord;

  static ConstRecurringPaymentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createConstRecurringPaymentsRecordData({
  String? name,
  String? icon,
}) {
  final firestoreData = serializers.toFirestore(
    ConstRecurringPaymentsRecord.serializer,
    ConstRecurringPaymentsRecord(
      (c) => c
        ..name = name
        ..icon = icon
        ..plans = null,
    ),
  );

  return firestoreData;
}
