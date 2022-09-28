import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'const_income_categories_record.g.dart';

abstract class ConstIncomeCategoriesRecord
    implements
        Built<ConstIncomeCategoriesRecord, ConstIncomeCategoriesRecordBuilder> {
  static Serializer<ConstIncomeCategoriesRecord> get serializer =>
      _$constIncomeCategoriesRecordSerializer;

  String? get categoryName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ConstIncomeCategoriesRecordBuilder builder) =>
      builder..categoryName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('constIncomeCategories');

  static Stream<ConstIncomeCategoriesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ConstIncomeCategoriesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ConstIncomeCategoriesRecord._();
  factory ConstIncomeCategoriesRecord(
          [void Function(ConstIncomeCategoriesRecordBuilder) updates]) =
      _$ConstIncomeCategoriesRecord;

  static ConstIncomeCategoriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createConstIncomeCategoriesRecordData({
  String? categoryName,
}) {
  final firestoreData = serializers.toFirestore(
    ConstIncomeCategoriesRecord.serializer,
    ConstIncomeCategoriesRecord(
      (c) => c..categoryName = categoryName,
    ),
  );

  return firestoreData;
}
