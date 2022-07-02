import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'categories_record.g.dart';

abstract class CategoriesRecord
    implements Built<CategoriesRecord, CategoriesRecordBuilder> {
  static Serializer<CategoriesRecord> get serializer =>
      _$categoriesRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'category_name')
  String get categoryName;

  @nullable
  @BuiltValueField(wireName: 'category_id')
  String get categoryId;

  @nullable
  @BuiltValueField(wireName: 'category_budget')
  DocumentReference get categoryBudget;

  @nullable
  @BuiltValueField(wireName: 'category_amount')
  int get categoryAmount;

  @nullable
  @BuiltValueField(wireName: 'category_owner')
  DocumentReference get categoryOwner;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(CategoriesRecordBuilder builder) => builder
    ..categoryName = ''
    ..categoryId = ''
    ..categoryAmount = 0;

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('categories')
          : FirebaseFirestore.instance.collectionGroup('categories');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('categories').doc();

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CategoriesRecord._();
  factory CategoriesRecord([void Function(CategoriesRecordBuilder) updates]) =
      _$CategoriesRecord;

  static CategoriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCategoriesRecordData({
  String categoryName,
  String categoryId,
  DocumentReference categoryBudget,
  int categoryAmount,
  DocumentReference categoryOwner,
}) =>
    serializers.toFirestore(
        CategoriesRecord.serializer,
        CategoriesRecord((c) => c
          ..categoryName = categoryName
          ..categoryId = categoryId
          ..categoryBudget = categoryBudget
          ..categoryAmount = categoryAmount
          ..categoryOwner = categoryOwner));
