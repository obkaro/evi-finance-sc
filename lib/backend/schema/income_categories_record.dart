import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'income_categories_record.g.dart';

abstract class IncomeCategoriesRecord
    implements Built<IncomeCategoriesRecord, IncomeCategoriesRecordBuilder> {
  static Serializer<IncomeCategoriesRecord> get serializer =>
      _$incomeCategoriesRecordSerializer;

  String? get categoryName;

  String? get categoryID;

  int? get categoryAmount;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(IncomeCategoriesRecordBuilder builder) =>
      builder
        ..categoryName = ''
        ..categoryID = ''
        ..categoryAmount = 0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('incomeCategories')
          : FirebaseFirestore.instance.collectionGroup('incomeCategories');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('incomeCategories').doc();

  static Stream<IncomeCategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<IncomeCategoriesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  IncomeCategoriesRecord._();
  factory IncomeCategoriesRecord(
          [void Function(IncomeCategoriesRecordBuilder) updates]) =
      _$IncomeCategoriesRecord;

  static IncomeCategoriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createIncomeCategoriesRecordData({
  String? categoryName,
  String? categoryID,
  int? categoryAmount,
}) {
  final firestoreData = serializers.toFirestore(
    IncomeCategoriesRecord.serializer,
    IncomeCategoriesRecord(
      (i) => i
        ..categoryName = categoryName
        ..categoryID = categoryID
        ..categoryAmount = categoryAmount,
    ),
  );

  return firestoreData;
}
