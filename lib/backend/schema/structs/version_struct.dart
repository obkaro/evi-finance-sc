import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'version_struct.g.dart';

abstract class VersionStruct
    implements Built<VersionStruct, VersionStructBuilder> {
  static Serializer<VersionStruct> get serializer => _$versionStructSerializer;

  String? get appName;

  String? get packageName;

  String? get versionNumber;

  String? get buildNumber;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(VersionStructBuilder builder) => builder
    ..appName = ''
    ..packageName = ''
    ..versionNumber = ''
    ..buildNumber = ''
    ..firestoreUtilData = FirestoreUtilData();

  VersionStruct._();
  factory VersionStruct([void Function(VersionStructBuilder) updates]) =
      _$VersionStruct;
}

VersionStruct createVersionStruct({
  String? appName,
  String? packageName,
  String? versionNumber,
  String? buildNumber,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VersionStruct(
      (v) => v
        ..appName = appName
        ..packageName = packageName
        ..versionNumber = versionNumber
        ..buildNumber = buildNumber
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

VersionStruct? updateVersionStruct(
  VersionStruct? version, {
  bool clearUnsetFields = true,
}) =>
    version != null
        ? (version.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addVersionStructData(
  Map<String, dynamic> firestoreData,
  VersionStruct? version,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (version == null) {
    return;
  }
  if (version.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && version.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final versionData = getVersionFirestoreData(version, forFieldValue);
  final nestedData = versionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = version.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getVersionFirestoreData(
  VersionStruct? version, [
  bool forFieldValue = false,
]) {
  if (version == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(VersionStruct.serializer, version);

  // Add any Firestore field values
  version.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVersionListFirestoreData(
  List<VersionStruct>? versions,
) =>
    versions?.map((v) => getVersionFirestoreData(v, true)).toList() ?? [];
