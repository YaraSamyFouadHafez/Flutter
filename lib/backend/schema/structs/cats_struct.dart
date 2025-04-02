// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CatsStruct extends FFFirebaseStruct {
  CatsStruct({
    DataStruct? data,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _data = data,
        super(firestoreUtilData);

  // "data" field.
  DataStruct? _data;
  DataStruct get data => _data ?? DataStruct();
  set data(DataStruct? val) => _data = val;

  void updateData(Function(DataStruct) updateFn) {
    updateFn(_data ??= DataStruct());
  }

  bool hasData() => _data != null;

  static CatsStruct fromMap(Map<String, dynamic> data) => CatsStruct(
        data: data['data'] is DataStruct
            ? data['data']
            : DataStruct.maybeFromMap(data['data']),
      );

  static CatsStruct? maybeFromMap(dynamic data) =>
      data is Map ? CatsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'data': _data?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static CatsStruct fromSerializableMap(Map<String, dynamic> data) =>
      CatsStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: DataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CatsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CatsStruct && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

CatsStruct createCatsStruct({
  DataStruct? data,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CatsStruct(
      data: data ?? (clearUnsetFields ? DataStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CatsStruct? updateCatsStruct(
  CatsStruct? cats, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cats
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCatsStructData(
  Map<String, dynamic> firestoreData,
  CatsStruct? cats,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cats == null) {
    return;
  }
  if (cats.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && cats.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final catsData = getCatsFirestoreData(cats, forFieldValue);
  final nestedData = catsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cats.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCatsFirestoreData(
  CatsStruct? cats, [
  bool forFieldValue = false,
]) {
  if (cats == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cats.toMap());

  // Handle nested data for "data" field.
  addDataStructData(
    firestoreData,
    cats.hasData() ? cats.data : null,
    'data',
    forFieldValue,
  );

  // Add any Firestore field values
  cats.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCatsListFirestoreData(
  List<CatsStruct>? catss,
) =>
    catss?.map((e) => getCatsFirestoreData(e, true)).toList() ?? [];
