// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class NameStruct extends FFFirebaseStruct {
  NameStruct({
    String? en,
    String? es,
    String? fr,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _en = en,
        _es = es,
        _fr = fr,
        super(firestoreUtilData);

  // "en" field.
  String? _en;
  String get en => _en ?? '';
  set en(String? val) => _en = val;

  bool hasEn() => _en != null;

  // "es" field.
  String? _es;
  String get es => _es ?? '';
  set es(String? val) => _es = val;

  bool hasEs() => _es != null;

  // "fr" field.
  String? _fr;
  String get fr => _fr ?? '';
  set fr(String? val) => _fr = val;

  bool hasFr() => _fr != null;

  static NameStruct fromMap(Map<String, dynamic> data) => NameStruct(
        en: data['en'] as String?,
        es: data['es'] as String?,
        fr: data['fr'] as String?,
      );

  static NameStruct? maybeFromMap(dynamic data) =>
      data is Map ? NameStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'en': _en,
        'es': _es,
        'fr': _fr,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'en': serializeParam(
          _en,
          ParamType.String,
        ),
        'es': serializeParam(
          _es,
          ParamType.String,
        ),
        'fr': serializeParam(
          _fr,
          ParamType.String,
        ),
      }.withoutNulls;

  static NameStruct fromSerializableMap(Map<String, dynamic> data) =>
      NameStruct(
        en: deserializeParam(
          data['en'],
          ParamType.String,
          false,
        ),
        es: deserializeParam(
          data['es'],
          ParamType.String,
          false,
        ),
        fr: deserializeParam(
          data['fr'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NameStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NameStruct &&
        en == other.en &&
        es == other.es &&
        fr == other.fr;
  }

  @override
  int get hashCode => const ListEquality().hash([en, es, fr]);
}

NameStruct createNameStruct({
  String? en,
  String? es,
  String? fr,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NameStruct(
      en: en,
      es: es,
      fr: fr,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NameStruct? updateNameStruct(
  NameStruct? name, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    name
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNameStructData(
  Map<String, dynamic> firestoreData,
  NameStruct? name,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (name == null) {
    return;
  }
  if (name.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && name.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final nameData = getNameFirestoreData(name, forFieldValue);
  final nestedData = nameData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = name.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNameFirestoreData(
  NameStruct? name, [
  bool forFieldValue = false,
]) {
  if (name == null) {
    return {};
  }
  final firestoreData = mapToFirestore(name.toMap());

  // Add any Firestore field values
  name.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNameListFirestoreData(
  List<NameStruct>? names,
) =>
    names?.map((e) => getNameFirestoreData(e, true)).toList() ?? [];
