import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ForceUpdateRecord extends FirestoreRecord {
  ForceUpdateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "LatestRelease" field.
  String? _latestRelease;
  String get latestRelease => _latestRelease ?? '';
  bool hasLatestRelease() => _latestRelease != null;

  // "MinimumVersion" field.
  String? _minimumVersion;
  String get minimumVersion => _minimumVersion ?? '';
  bool hasMinimumVersion() => _minimumVersion != null;

  // "UpdateMessage" field.
  String? _updateMessage;
  String get updateMessage => _updateMessage ?? '';
  bool hasUpdateMessage() => _updateMessage != null;

  void _initializeFields() {
    _latestRelease = snapshotData['LatestRelease'] as String?;
    _minimumVersion = snapshotData['MinimumVersion'] as String?;
    _updateMessage = snapshotData['UpdateMessage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ForceUpdate');

  static Stream<ForceUpdateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ForceUpdateRecord.fromSnapshot(s));

  static Future<ForceUpdateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ForceUpdateRecord.fromSnapshot(s));

  static ForceUpdateRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ForceUpdateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ForceUpdateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ForceUpdateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ForceUpdateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ForceUpdateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createForceUpdateRecordData({
  String? latestRelease,
  String? minimumVersion,
  String? updateMessage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'LatestRelease': latestRelease,
      'MinimumVersion': minimumVersion,
      'UpdateMessage': updateMessage,
    }.withoutNulls,
  );

  return firestoreData;
}

class ForceUpdateRecordDocumentEquality implements Equality<ForceUpdateRecord> {
  const ForceUpdateRecordDocumentEquality();

  @override
  bool equals(ForceUpdateRecord? e1, ForceUpdateRecord? e2) {
    return e1?.latestRelease == e2?.latestRelease &&
        e1?.minimumVersion == e2?.minimumVersion &&
        e1?.updateMessage == e2?.updateMessage;
  }

  @override
  int hash(ForceUpdateRecord? e) => const ListEquality()
      .hash([e?.latestRelease, e?.minimumVersion, e?.updateMessage]);

  @override
  bool isValidKey(Object? o) => o is ForceUpdateRecord;
}
