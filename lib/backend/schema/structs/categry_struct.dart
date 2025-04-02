// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CategryStruct extends FFFirebaseStruct {
  CategryStruct({
    String? categoryId,
    String? categoryNameEn,
    String? categoryNameFr,
    String? categoryNameEs,
    String? categoryDescriptionEn,
    String? categoryDescriptionFr,
    String? categoryDescriptionEs,
    String? categoryThumbnailUrl,
    String? categoryType,
    String? categorySlug,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _categoryId = categoryId,
        _categoryNameEn = categoryNameEn,
        _categoryNameFr = categoryNameFr,
        _categoryNameEs = categoryNameEs,
        _categoryDescriptionEn = categoryDescriptionEn,
        _categoryDescriptionFr = categoryDescriptionFr,
        _categoryDescriptionEs = categoryDescriptionEs,
        _categoryThumbnailUrl = categoryThumbnailUrl,
        _categoryType = categoryType,
        _categorySlug = categorySlug,
        super(firestoreUtilData);

  // "categoryId" field.
  String? _categoryId;
  String get categoryId => _categoryId ?? 'categoryId_Default Value';
  set categoryId(String? val) => _categoryId = val;

  bool hasCategoryId() => _categoryId != null;

  // "categoryNameEn" field.
  String? _categoryNameEn;
  String get categoryNameEn =>
      _categoryNameEn ?? 'categoryNameEn_Default Value';
  set categoryNameEn(String? val) => _categoryNameEn = val;

  bool hasCategoryNameEn() => _categoryNameEn != null;

  // "categoryNameFr" field.
  String? _categoryNameFr;
  String get categoryNameFr =>
      _categoryNameFr ?? 'categoryNameFr_Default Value';
  set categoryNameFr(String? val) => _categoryNameFr = val;

  bool hasCategoryNameFr() => _categoryNameFr != null;

  // "categoryNameEs" field.
  String? _categoryNameEs;
  String get categoryNameEs =>
      _categoryNameEs ?? 'categoryNameEs_Default Value';
  set categoryNameEs(String? val) => _categoryNameEs = val;

  bool hasCategoryNameEs() => _categoryNameEs != null;

  // "categoryDescriptionEn" field.
  String? _categoryDescriptionEn;
  String get categoryDescriptionEn =>
      _categoryDescriptionEn ?? 'categoryDescriptionEn_Default Value';
  set categoryDescriptionEn(String? val) => _categoryDescriptionEn = val;

  bool hasCategoryDescriptionEn() => _categoryDescriptionEn != null;

  // "categoryDescriptionFr" field.
  String? _categoryDescriptionFr;
  String get categoryDescriptionFr =>
      _categoryDescriptionFr ?? 'categoryDescriptionFr_Default Value';
  set categoryDescriptionFr(String? val) => _categoryDescriptionFr = val;

  bool hasCategoryDescriptionFr() => _categoryDescriptionFr != null;

  // "categoryDescriptionEs" field.
  String? _categoryDescriptionEs;
  String get categoryDescriptionEs =>
      _categoryDescriptionEs ?? 'categoryDescriptionEs_Default Value';
  set categoryDescriptionEs(String? val) => _categoryDescriptionEs = val;

  bool hasCategoryDescriptionEs() => _categoryDescriptionEs != null;

  // "categoryThumbnailUrl" field.
  String? _categoryThumbnailUrl;
  String get categoryThumbnailUrl =>
      _categoryThumbnailUrl ??
      'https://unsplash.com/photos/brown-wooden-cross-during-golden-hour-5c5VcFshOds';
  set categoryThumbnailUrl(String? val) => _categoryThumbnailUrl = val;

  bool hasCategoryThumbnailUrl() => _categoryThumbnailUrl != null;

  // "categoryType" field.
  String? _categoryType;
  String get categoryType => _categoryType ?? 'categoryType_Default Value';
  set categoryType(String? val) => _categoryType = val;

  bool hasCategoryType() => _categoryType != null;

  // "categorySlug" field.
  String? _categorySlug;
  String get categorySlug => _categorySlug ?? 'categorySlug_Default Value';
  set categorySlug(String? val) => _categorySlug = val;

  bool hasCategorySlug() => _categorySlug != null;

  static CategryStruct fromMap(Map<String, dynamic> data) => CategryStruct(
        categoryId: data['categoryId'] as String?,
        categoryNameEn: data['categoryNameEn'] as String?,
        categoryNameFr: data['categoryNameFr'] as String?,
        categoryNameEs: data['categoryNameEs'] as String?,
        categoryDescriptionEn: data['categoryDescriptionEn'] as String?,
        categoryDescriptionFr: data['categoryDescriptionFr'] as String?,
        categoryDescriptionEs: data['categoryDescriptionEs'] as String?,
        categoryThumbnailUrl: data['categoryThumbnailUrl'] as String?,
        categoryType: data['categoryType'] as String?,
        categorySlug: data['categorySlug'] as String?,
      );

  static CategryStruct? maybeFromMap(dynamic data) =>
      data is Map ? CategryStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'categoryId': _categoryId,
        'categoryNameEn': _categoryNameEn,
        'categoryNameFr': _categoryNameFr,
        'categoryNameEs': _categoryNameEs,
        'categoryDescriptionEn': _categoryDescriptionEn,
        'categoryDescriptionFr': _categoryDescriptionFr,
        'categoryDescriptionEs': _categoryDescriptionEs,
        'categoryThumbnailUrl': _categoryThumbnailUrl,
        'categoryType': _categoryType,
        'categorySlug': _categorySlug,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'categoryId': serializeParam(
          _categoryId,
          ParamType.String,
        ),
        'categoryNameEn': serializeParam(
          _categoryNameEn,
          ParamType.String,
        ),
        'categoryNameFr': serializeParam(
          _categoryNameFr,
          ParamType.String,
        ),
        'categoryNameEs': serializeParam(
          _categoryNameEs,
          ParamType.String,
        ),
        'categoryDescriptionEn': serializeParam(
          _categoryDescriptionEn,
          ParamType.String,
        ),
        'categoryDescriptionFr': serializeParam(
          _categoryDescriptionFr,
          ParamType.String,
        ),
        'categoryDescriptionEs': serializeParam(
          _categoryDescriptionEs,
          ParamType.String,
        ),
        'categoryThumbnailUrl': serializeParam(
          _categoryThumbnailUrl,
          ParamType.String,
        ),
        'categoryType': serializeParam(
          _categoryType,
          ParamType.String,
        ),
        'categorySlug': serializeParam(
          _categorySlug,
          ParamType.String,
        ),
      }.withoutNulls;

  static CategryStruct fromSerializableMap(Map<String, dynamic> data) =>
      CategryStruct(
        categoryId: deserializeParam(
          data['categoryId'],
          ParamType.String,
          false,
        ),
        categoryNameEn: deserializeParam(
          data['categoryNameEn'],
          ParamType.String,
          false,
        ),
        categoryNameFr: deserializeParam(
          data['categoryNameFr'],
          ParamType.String,
          false,
        ),
        categoryNameEs: deserializeParam(
          data['categoryNameEs'],
          ParamType.String,
          false,
        ),
        categoryDescriptionEn: deserializeParam(
          data['categoryDescriptionEn'],
          ParamType.String,
          false,
        ),
        categoryDescriptionFr: deserializeParam(
          data['categoryDescriptionFr'],
          ParamType.String,
          false,
        ),
        categoryDescriptionEs: deserializeParam(
          data['categoryDescriptionEs'],
          ParamType.String,
          false,
        ),
        categoryThumbnailUrl: deserializeParam(
          data['categoryThumbnailUrl'],
          ParamType.String,
          false,
        ),
        categoryType: deserializeParam(
          data['categoryType'],
          ParamType.String,
          false,
        ),
        categorySlug: deserializeParam(
          data['categorySlug'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CategryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CategryStruct &&
        categoryId == other.categoryId &&
        categoryNameEn == other.categoryNameEn &&
        categoryNameFr == other.categoryNameFr &&
        categoryNameEs == other.categoryNameEs &&
        categoryDescriptionEn == other.categoryDescriptionEn &&
        categoryDescriptionFr == other.categoryDescriptionFr &&
        categoryDescriptionEs == other.categoryDescriptionEs &&
        categoryThumbnailUrl == other.categoryThumbnailUrl &&
        categoryType == other.categoryType &&
        categorySlug == other.categorySlug;
  }

  @override
  int get hashCode => const ListEquality().hash([
        categoryId,
        categoryNameEn,
        categoryNameFr,
        categoryNameEs,
        categoryDescriptionEn,
        categoryDescriptionFr,
        categoryDescriptionEs,
        categoryThumbnailUrl,
        categoryType,
        categorySlug
      ]);
}

CategryStruct createCategryStruct({
  String? categoryId,
  String? categoryNameEn,
  String? categoryNameFr,
  String? categoryNameEs,
  String? categoryDescriptionEn,
  String? categoryDescriptionFr,
  String? categoryDescriptionEs,
  String? categoryThumbnailUrl,
  String? categoryType,
  String? categorySlug,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CategryStruct(
      categoryId: categoryId,
      categoryNameEn: categoryNameEn,
      categoryNameFr: categoryNameFr,
      categoryNameEs: categoryNameEs,
      categoryDescriptionEn: categoryDescriptionEn,
      categoryDescriptionFr: categoryDescriptionFr,
      categoryDescriptionEs: categoryDescriptionEs,
      categoryThumbnailUrl: categoryThumbnailUrl,
      categoryType: categoryType,
      categorySlug: categorySlug,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CategryStruct? updateCategryStruct(
  CategryStruct? categry, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    categry
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCategryStructData(
  Map<String, dynamic> firestoreData,
  CategryStruct? categry,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (categry == null) {
    return;
  }
  if (categry.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && categry.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final categryData = getCategryFirestoreData(categry, forFieldValue);
  final nestedData = categryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = categry.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCategryFirestoreData(
  CategryStruct? categry, [
  bool forFieldValue = false,
]) {
  if (categry == null) {
    return {};
  }
  final firestoreData = mapToFirestore(categry.toMap());

  // Add any Firestore field values
  categry.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCategryListFirestoreData(
  List<CategryStruct>? categrys,
) =>
    categrys?.map((e) => getCategryFirestoreData(e, true)).toList() ?? [];
