import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "allowPushNotification" field.
  bool? _allowPushNotification;
  bool get allowPushNotification => _allowPushNotification ?? false;
  bool hasAllowPushNotification() => _allowPushNotification != null;

  // "FCMToken" field.
  String? _fCMToken;
  String get fCMToken => _fCMToken ?? '';
  bool hasFCMToken() => _fCMToken != null;

  // "prayUser" field.
  bool? _prayUser;
  bool get prayUser => _prayUser ?? false;
  bool hasPrayUser() => _prayUser != null;

  // "ipAddress" field.
  String? _ipAddress;
  String get ipAddress => _ipAddress ?? '';
  bool hasIpAddress() => _ipAddress != null;

  // "countryName" field.
  String? _countryName;
  String get countryName => _countryName ?? '';
  bool hasCountryName() => _countryName != null;

  // "deviceType" field.
  String? _deviceType;
  String get deviceType => _deviceType ?? '';
  bool hasDeviceType() => _deviceType != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _city = snapshotData['city'] as String?;
    _allowPushNotification = snapshotData['allowPushNotification'] as bool?;
    _fCMToken = snapshotData['FCMToken'] as String?;
    _prayUser = snapshotData['prayUser'] as bool?;
    _ipAddress = snapshotData['ipAddress'] as String?;
    _countryName = snapshotData['countryName'] as String?;
    _deviceType = snapshotData['deviceType'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? city,
  bool? allowPushNotification,
  String? fCMToken,
  bool? prayUser,
  String? ipAddress,
  String? countryName,
  String? deviceType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'city': city,
      'allowPushNotification': allowPushNotification,
      'FCMToken': fCMToken,
      'prayUser': prayUser,
      'ipAddress': ipAddress,
      'countryName': countryName,
      'deviceType': deviceType,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.city == e2?.city &&
        e1?.allowPushNotification == e2?.allowPushNotification &&
        e1?.fCMToken == e2?.fCMToken &&
        e1?.prayUser == e2?.prayUser &&
        e1?.ipAddress == e2?.ipAddress &&
        e1?.countryName == e2?.countryName &&
        e1?.deviceType == e2?.deviceType;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.city,
        e?.allowPushNotification,
        e?.fCMToken,
        e?.prayUser,
        e?.ipAddress,
        e?.countryName,
        e?.deviceType
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
