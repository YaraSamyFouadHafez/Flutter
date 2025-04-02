// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PostStruct extends FFFirebaseStruct {
  PostStruct({
    String? postId,
    String? postTitleEn,
    String? postTitleFr,
    String? postTitleEs,
    String? postContentEn,
    String? postContentFr,
    String? postContentEs,
    String? postType,
    String? postThumbnailUrl,
    String? postCategoryId,
    DateTime? postPublishedAtDate,
    String? postVideoUrl,
    String? postAudioUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _postId = postId,
        _postTitleEn = postTitleEn,
        _postTitleFr = postTitleFr,
        _postTitleEs = postTitleEs,
        _postContentEn = postContentEn,
        _postContentFr = postContentFr,
        _postContentEs = postContentEs,
        _postType = postType,
        _postThumbnailUrl = postThumbnailUrl,
        _postCategoryId = postCategoryId,
        _postPublishedAtDate = postPublishedAtDate,
        _postVideoUrl = postVideoUrl,
        _postAudioUrl = postAudioUrl,
        super(firestoreUtilData);

  // "postId" field.
  String? _postId;
  String get postId => _postId ?? 'PostId_Default Value';
  set postId(String? val) => _postId = val;

  bool hasPostId() => _postId != null;

  // "postTitleEn" field.
  String? _postTitleEn;
  String get postTitleEn => _postTitleEn ?? 'PostTitleEn_Default Value';
  set postTitleEn(String? val) => _postTitleEn = val;

  bool hasPostTitleEn() => _postTitleEn != null;

  // "postTitleFr" field.
  String? _postTitleFr;
  String get postTitleFr => _postTitleFr ?? 'PostTitleFr_Default Value';
  set postTitleFr(String? val) => _postTitleFr = val;

  bool hasPostTitleFr() => _postTitleFr != null;

  // "postTitleEs" field.
  String? _postTitleEs;
  String get postTitleEs => _postTitleEs ?? 'PostTitleEs_Default Value';
  set postTitleEs(String? val) => _postTitleEs = val;

  bool hasPostTitleEs() => _postTitleEs != null;

  // "postContentEn" field.
  String? _postContentEn;
  String get postContentEn => _postContentEn ?? 'PostContentEn_Default Value';
  set postContentEn(String? val) => _postContentEn = val;

  bool hasPostContentEn() => _postContentEn != null;

  // "postContentFr" field.
  String? _postContentFr;
  String get postContentFr => _postContentFr ?? 'PostContentFr_Default Value';
  set postContentFr(String? val) => _postContentFr = val;

  bool hasPostContentFr() => _postContentFr != null;

  // "postContentEs" field.
  String? _postContentEs;
  String get postContentEs => _postContentEs ?? 'PostContentEs_Default Value';
  set postContentEs(String? val) => _postContentEs = val;

  bool hasPostContentEs() => _postContentEs != null;

  // "postType" field.
  String? _postType;
  String get postType => _postType ?? 'PostType_Default Value';
  set postType(String? val) => _postType = val;

  bool hasPostType() => _postType != null;

  // "postThumbnailUrl" field.
  String? _postThumbnailUrl;
  String get postThumbnailUrl =>
      _postThumbnailUrl ??
      'https://unsplash.com/photos/cross-stand-under-purple-and-blue-sky-vKBdY7e7KFk';
  set postThumbnailUrl(String? val) => _postThumbnailUrl = val;

  bool hasPostThumbnailUrl() => _postThumbnailUrl != null;

  // "postCategoryId" field.
  String? _postCategoryId;
  String get postCategoryId =>
      _postCategoryId ?? 'PostCategoryId_Default Value';
  set postCategoryId(String? val) => _postCategoryId = val;

  bool hasPostCategoryId() => _postCategoryId != null;

  // "postPublishedAtDate" field.
  DateTime? _postPublishedAtDate;
  DateTime get postPublishedAtDate =>
      _postPublishedAtDate ??
      DateTime.fromMicrosecondsSinceEpoch(946677600000000);
  set postPublishedAtDate(DateTime? val) => _postPublishedAtDate = val;

  bool hasPostPublishedAtDate() => _postPublishedAtDate != null;

  // "postVideoUrl" field.
  String? _postVideoUrl;
  String get postVideoUrl =>
      _postVideoUrl ??
      'https://www.youtube.com/watch?v=oQV1p1UjqE4&ab_channel=ScriptureLullabies';
  set postVideoUrl(String? val) => _postVideoUrl = val;

  bool hasPostVideoUrl() => _postVideoUrl != null;

  // "postAudioUrl" field.
  String? _postAudioUrl;
  String get postAudioUrl =>
      _postAudioUrl ?? 'https://anbamaximus.org/post.php?Id=3518';
  set postAudioUrl(String? val) => _postAudioUrl = val;

  bool hasPostAudioUrl() => _postAudioUrl != null;

  static PostStruct fromMap(Map<String, dynamic> data) => PostStruct(
        postId: data['postId'] as String?,
        postTitleEn: data['postTitleEn'] as String?,
        postTitleFr: data['postTitleFr'] as String?,
        postTitleEs: data['postTitleEs'] as String?,
        postContentEn: data['postContentEn'] as String?,
        postContentFr: data['postContentFr'] as String?,
        postContentEs: data['postContentEs'] as String?,
        postType: data['postType'] as String?,
        postThumbnailUrl: data['postThumbnailUrl'] as String?,
        postCategoryId: data['postCategoryId'] as String?,
        postPublishedAtDate: data['postPublishedAtDate'] as DateTime?,
        postVideoUrl: data['postVideoUrl'] as String?,
        postAudioUrl: data['postAudioUrl'] as String?,
      );

  static PostStruct? maybeFromMap(dynamic data) =>
      data is Map ? PostStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'postId': _postId,
        'postTitleEn': _postTitleEn,
        'postTitleFr': _postTitleFr,
        'postTitleEs': _postTitleEs,
        'postContentEn': _postContentEn,
        'postContentFr': _postContentFr,
        'postContentEs': _postContentEs,
        'postType': _postType,
        'postThumbnailUrl': _postThumbnailUrl,
        'postCategoryId': _postCategoryId,
        'postPublishedAtDate': _postPublishedAtDate,
        'postVideoUrl': _postVideoUrl,
        'postAudioUrl': _postAudioUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'postId': serializeParam(
          _postId,
          ParamType.String,
        ),
        'postTitleEn': serializeParam(
          _postTitleEn,
          ParamType.String,
        ),
        'postTitleFr': serializeParam(
          _postTitleFr,
          ParamType.String,
        ),
        'postTitleEs': serializeParam(
          _postTitleEs,
          ParamType.String,
        ),
        'postContentEn': serializeParam(
          _postContentEn,
          ParamType.String,
        ),
        'postContentFr': serializeParam(
          _postContentFr,
          ParamType.String,
        ),
        'postContentEs': serializeParam(
          _postContentEs,
          ParamType.String,
        ),
        'postType': serializeParam(
          _postType,
          ParamType.String,
        ),
        'postThumbnailUrl': serializeParam(
          _postThumbnailUrl,
          ParamType.String,
        ),
        'postCategoryId': serializeParam(
          _postCategoryId,
          ParamType.String,
        ),
        'postPublishedAtDate': serializeParam(
          _postPublishedAtDate,
          ParamType.DateTime,
        ),
        'postVideoUrl': serializeParam(
          _postVideoUrl,
          ParamType.String,
        ),
        'postAudioUrl': serializeParam(
          _postAudioUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static PostStruct fromSerializableMap(Map<String, dynamic> data) =>
      PostStruct(
        postId: deserializeParam(
          data['postId'],
          ParamType.String,
          false,
        ),
        postTitleEn: deserializeParam(
          data['postTitleEn'],
          ParamType.String,
          false,
        ),
        postTitleFr: deserializeParam(
          data['postTitleFr'],
          ParamType.String,
          false,
        ),
        postTitleEs: deserializeParam(
          data['postTitleEs'],
          ParamType.String,
          false,
        ),
        postContentEn: deserializeParam(
          data['postContentEn'],
          ParamType.String,
          false,
        ),
        postContentFr: deserializeParam(
          data['postContentFr'],
          ParamType.String,
          false,
        ),
        postContentEs: deserializeParam(
          data['postContentEs'],
          ParamType.String,
          false,
        ),
        postType: deserializeParam(
          data['postType'],
          ParamType.String,
          false,
        ),
        postThumbnailUrl: deserializeParam(
          data['postThumbnailUrl'],
          ParamType.String,
          false,
        ),
        postCategoryId: deserializeParam(
          data['postCategoryId'],
          ParamType.String,
          false,
        ),
        postPublishedAtDate: deserializeParam(
          data['postPublishedAtDate'],
          ParamType.DateTime,
          false,
        ),
        postVideoUrl: deserializeParam(
          data['postVideoUrl'],
          ParamType.String,
          false,
        ),
        postAudioUrl: deserializeParam(
          data['postAudioUrl'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PostStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PostStruct &&
        postId == other.postId &&
        postTitleEn == other.postTitleEn &&
        postTitleFr == other.postTitleFr &&
        postTitleEs == other.postTitleEs &&
        postContentEn == other.postContentEn &&
        postContentFr == other.postContentFr &&
        postContentEs == other.postContentEs &&
        postType == other.postType &&
        postThumbnailUrl == other.postThumbnailUrl &&
        postCategoryId == other.postCategoryId &&
        postPublishedAtDate == other.postPublishedAtDate &&
        postVideoUrl == other.postVideoUrl &&
        postAudioUrl == other.postAudioUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([
        postId,
        postTitleEn,
        postTitleFr,
        postTitleEs,
        postContentEn,
        postContentFr,
        postContentEs,
        postType,
        postThumbnailUrl,
        postCategoryId,
        postPublishedAtDate,
        postVideoUrl,
        postAudioUrl
      ]);
}

PostStruct createPostStruct({
  String? postId,
  String? postTitleEn,
  String? postTitleFr,
  String? postTitleEs,
  String? postContentEn,
  String? postContentFr,
  String? postContentEs,
  String? postType,
  String? postThumbnailUrl,
  String? postCategoryId,
  DateTime? postPublishedAtDate,
  String? postVideoUrl,
  String? postAudioUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PostStruct(
      postId: postId,
      postTitleEn: postTitleEn,
      postTitleFr: postTitleFr,
      postTitleEs: postTitleEs,
      postContentEn: postContentEn,
      postContentFr: postContentFr,
      postContentEs: postContentEs,
      postType: postType,
      postThumbnailUrl: postThumbnailUrl,
      postCategoryId: postCategoryId,
      postPublishedAtDate: postPublishedAtDate,
      postVideoUrl: postVideoUrl,
      postAudioUrl: postAudioUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PostStruct? updatePostStruct(
  PostStruct? post, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    post
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPostStructData(
  Map<String, dynamic> firestoreData,
  PostStruct? post,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (post == null) {
    return;
  }
  if (post.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && post.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final postData = getPostFirestoreData(post, forFieldValue);
  final nestedData = postData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = post.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPostFirestoreData(
  PostStruct? post, [
  bool forFieldValue = false,
]) {
  if (post == null) {
    return {};
  }
  final firestoreData = mapToFirestore(post.toMap());

  // Add any Firestore field values
  post.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPostListFirestoreData(
  List<PostStruct>? posts,
) =>
    posts?.map((e) => getPostFirestoreData(e, true)).toList() ?? [];
