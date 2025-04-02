// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DescriptionStruct extends FFFirebaseStruct {
  DescriptionStruct({
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

  static DescriptionStruct fromMap(Map<String, dynamic> data) =>
      DescriptionStruct(
        en: data['en'] as String?,
        es: data['es'] as String?,
        fr: data['fr'] as String?,
      );

  static DescriptionStruct? maybeFromMap(dynamic data) => data is Map
      ? DescriptionStruct.fromMap(data.cast<String, dynamic>())
      : null;

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

  static DescriptionStruct fromSerializableMap(Map<String, dynamic> data) =>
      DescriptionStruct(
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
  String toString() => 'DescriptionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DescriptionStruct &&
        en == other.en &&
        es == other.es &&
        fr == other.fr;
  }

  @override
  int get hashCode => const ListEquality().hash([en, es, fr]);
}

DescriptionStruct createDescriptionStruct({
  String? en,
  String? es,
  String? fr,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DescriptionStruct(
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

DescriptionStruct? updateDescriptionStruct(
  DescriptionStruct? description, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    description
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDescriptionStructData(
  Map<String, dynamic> firestoreData,
  DescriptionStruct? description,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (description == null) {
    return;
  }
  if (description.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && description.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final descriptionData =
      getDescriptionFirestoreData(description, forFieldValue);
  final nestedData =
      descriptionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = description.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDescriptionFirestoreData(
  DescriptionStruct? description, [
  bool forFieldValue = false,
]) {
  if (description == null) {
    return {};
  }
  final firestoreData = mapToFirestore(description.toMap());

  // Add any Firestore field values
  description.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDescriptionListFirestoreData(
  List<DescriptionStruct>? descriptions,
) =>
    descriptions?.map((e) => getDescriptionFirestoreData(e, true)).toList() ??
    [];
