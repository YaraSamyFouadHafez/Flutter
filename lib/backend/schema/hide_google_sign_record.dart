import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HideGoogleSignRecord extends FirestoreRecord {
  HideGoogleSignRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "show" field.
  bool? _show;
  bool get show => _show ?? false;
  bool hasShow() => _show != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  void _initializeFields() {
    _show = snapshotData['show'] as bool?;
    _id = castToType<int>(snapshotData['id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('HideGoogleSign');

  static Stream<HideGoogleSignRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HideGoogleSignRecord.fromSnapshot(s));

  static Future<HideGoogleSignRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HideGoogleSignRecord.fromSnapshot(s));

  static HideGoogleSignRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HideGoogleSignRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HideGoogleSignRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HideGoogleSignRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HideGoogleSignRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HideGoogleSignRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHideGoogleSignRecordData({
  bool? show,
  int? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'show': show,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class HideGoogleSignRecordDocumentEquality
    implements Equality<HideGoogleSignRecord> {
  const HideGoogleSignRecordDocumentEquality();

  @override
  bool equals(HideGoogleSignRecord? e1, HideGoogleSignRecord? e2) {
    return e1?.show == e2?.show && e1?.id == e2?.id;
  }

  @override
  int hash(HideGoogleSignRecord? e) =>
      const ListEquality().hash([e?.show, e?.id]);

  @override
  bool isValidKey(Object? o) => o is HideGoogleSignRecord;
}
