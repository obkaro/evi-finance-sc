import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'transactions_record.g.dart';

abstract class TransactionsRecord
    implements Built<TransactionsRecord, TransactionsRecordBuilder> {
  static Serializer<TransactionsRecord> get serializer =>
      _$transactionsRecordSerializer;

  @nullable
  DateTime get trasactionDate;

  @nullable
  DocumentReference get account;

  @nullable
  String get monoCategory;

  @nullable
  DocumentReference get transactionOwner;

  @nullable
  int get balanceAfter;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TransactionsRecordBuilder builder) => builder
    ..monoCategory = ''
    ..balanceAfter = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transactions');

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  TransactionsRecord._();
  factory TransactionsRecord(
          [void Function(TransactionsRecordBuilder) updates]) =
      _$TransactionsRecord;

  static TransactionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTransactionsRecordData({
  DateTime trasactionDate,
  DocumentReference account,
  String monoCategory,
  DocumentReference transactionOwner,
  int balanceAfter,
}) =>
    serializers.toFirestore(
        TransactionsRecord.serializer,
        TransactionsRecord((t) => t
          ..trasactionDate = trasactionDate
          ..account = account
          ..monoCategory = monoCategory
          ..transactionOwner = transactionOwner
          ..balanceAfter = balanceAfter));
