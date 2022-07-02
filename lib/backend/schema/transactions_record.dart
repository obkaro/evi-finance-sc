import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'transactions_record.g.dart';

abstract class TransactionsRecord
    implements Built<TransactionsRecord, TransactionsRecordBuilder> {
  static Serializer<TransactionsRecord> get serializer =>
      _$transactionsRecordSerializer;

  DateTime? get trasactionDate;

  DocumentReference? get account;

  String? get monoCategory;

  DocumentReference? get transactionOwner;

  int? get balanceAfter;

  String? get transactionMonoID;

  int? get transactionAmount;

  String? get transactionType;

  String? get transactionNarration;

  DocumentReference? get linkedCategory;

  bool? get isCategorized;

  String? get transactionID;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ref;
  DocumentReference get reference => ref!;

  static void _initializeBuilder(TransactionsRecordBuilder builder) => builder
    ..monoCategory = ''
    ..balanceAfter = 0
    ..transactionMonoID = ''
    ..transactionAmount = 0
    ..transactionType = ''
    ..transactionNarration = ''
    ..isCategorized = false
    ..transactionID = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transactions');

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TransactionsRecord._();
  factory TransactionsRecord(
          [void Function(TransactionsRecordBuilder) updates]) =
      _$TransactionsRecord;

  static TransactionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTransactionsRecordData({
  DateTime? trasactionDate,
  DocumentReference? account,
  String? monoCategory,
  DocumentReference? transactionOwner,
  int? balanceAfter,
  String? transactionMonoID,
  int? transactionAmount,
  String? transactionType,
  String? transactionNarration,
  DocumentReference? linkedCategory,
  bool? isCategorized,
  String? transactionID,
}) =>
    serializers.toFirestore(
        TransactionsRecord.serializer,
        TransactionsRecord((t) => t
          ..trasactionDate = trasactionDate
          ..account = account
          ..monoCategory = monoCategory
          ..transactionOwner = transactionOwner
          ..balanceAfter = balanceAfter
          ..transactionMonoID = transactionMonoID
          ..transactionAmount = transactionAmount
          ..transactionType = transactionType
          ..transactionNarration = transactionNarration
          ..linkedCategory = linkedCategory
          ..isCategorized = isCategorized
          ..transactionID = transactionID));
