import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';


export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start  St Athanasius API Group Code

class StAthanasiusAPIGroup {
  static String getBaseUrl({
    String? jwt = '',
  }) =>
      'https://api.st.goodshepherdmail.com/api/v1';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [jwt]',
  };
  static GetPostsVOneCall getPostsVOneCall = GetPostsVOneCall();
  static GetCategoriesVOneCall getCategoriesVOneCall = GetCategoriesVOneCall();
  static GetSinglePostVOneCall getSinglePostVOneCall = GetSinglePostVOneCall();
  static SignUpVOneCall signUpVOneCall = SignUpVOneCall();
  static UpdateUsersVOneCall updateUsersVOneCall = UpdateUsersVOneCall();
  static FCMUpdateVOneCall fCMUpdateVOneCall = FCMUpdateVOneCall();
  static GetTheBreadOfLifeCall getTheBreadOfLifeCall = GetTheBreadOfLifeCall();
  static DeleteUserApiVOneCall deleteUserApiVOneCall = DeleteUserApiVOneCall();
  static ContactUsVOneCall contactUsVOneCall = ContactUsVOneCall();
  static DeleteAnonymousVOneCall deleteAnonymousVOneCall =
      DeleteAnonymousVOneCall();
  static GoogleLoginVOneCall googleLoginVOneCall = GoogleLoginVOneCall();
  static RecentPostsCall recentPostsCall = RecentPostsCall();
  static GetCategoriesHomeVOneCall getCategoriesHomeVOneCall =
      GetCategoriesHomeVOneCall();
  static LoginUpdateTokenVOneCall loginUpdateTokenVOneCall =
      LoginUpdateTokenVOneCall();
  static RadioUrlCall radioUrlCall = RadioUrlCall();
}

class GetPostsVOneCall {
  Future<ApiCallResponse> call({
    String? type = '',
    String? categoryId = '',
    String? excludeCategories = '',
    String? includeCategories = '',
    String? search = '',
    String? publishedBefore = '',
    String? sortBy = 'publishedAt',
    int? page,
    int? limit,
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetPosts V One',
      apiUrl: '${baseUrl}/posts',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'type': type,
        'categoryId': categoryId,
        'excludeCategories': excludeCategories,
        'includeCategories': includeCategories,
        'search': search,
        'publishedBefore': publishedBefore,
        'sortBy': sortBy,
        'page': page,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? postTitle(dynamic response) => (getJsonField(
        response,
        r'''$.data.posts[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? postContent(dynamic response) => (getJsonField(
        response,
        r'''$.data.posts[:].content''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? postType(dynamic response) => (getJsonField(
        response,
        r'''$.data.posts[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? postImage(dynamic response) => (getJsonField(
        response,
        r'''$.data.posts[:].thumbnailUrl''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? categoryName(dynamic response) => (getJsonField(
        response,
        r'''$.data.posts[:].categoryId.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? postTime(dynamic response) => (getJsonField(
        response,
        r'''$.data.posts[:].publishedAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? newTokenFromOldOne(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.newToken''',
      ));
}

class GetCategoriesVOneCall {
  Future<ApiCallResponse> call({
    bool? includeSubcategories,
    String? type = '',
    String? parentCategory = '',
    bool? root = true,
    int? page,
    int? limit,
    String? publishedBefore = '',
    String? sortBy = 'publishedAt',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetCategories V One',
      apiUrl: '${baseUrl}/categories',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'includeSubcategories': includeSubcategories,
        'type': type,
        'parentCategory': parentCategory,
        'root': root,
        'page': page,
        'limit': limit,
        'publishedBefore': publishedBefore,
        'sortBy': sortBy,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? categoryImage(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].thumbnailUrl''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? categoryName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? categoryId(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? categoryType(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? categoryDescription(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? hasSubCategory(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].hasSubCategories''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  String? newTokenFromOldOne(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.newToken''',
      ));
}

class GetSinglePostVOneCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetSinglePost V One',
      apiUrl: '${baseUrl}/posts/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? newTokenFromOldOne(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.newToken''',
      ));
  String? postType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].type''',
      ));
  String? postTitle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].title''',
      ));
  String? postContent(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].content''',
      ));
  String? postImage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].thumbnailUrl''',
      ));
  String? postDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].publishedAt''',
      ));
  String? postId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].id''',
      ));
  String? categoryName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].categoryId.name''',
      ));
  String? categoryId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].categoryId.id''',
      ));
  String? categorryDescrption(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].categoryId.description''',
      ));
  String? postVideoUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].videoUrl''',
      ));
}

class SignUpVOneCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? password = '',
    String? fireUserId = '',
    String? userSignType = '',
    String? ipAddress = '',
    String? firstDeviceType = '',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "name": "${name}",
  "email": "${email}",
  "password": "${password}",
  "fireUserId": "${fireUserId}",
  "userSignType": "${userSignType}",
  "ipAddress": "${ipAddress}",
  "firstDeviceType": "${firstDeviceType}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SignUp V One',
      apiUrl: '${baseUrl}/auth/signup',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? signupTokenResponse(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.token''',
      ));
}

class UpdateUsersVOneCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? phone = '',
    String? city = '',
    String? email = '',
    String? fireUserId = '',
    String? userSignType = '',
    String? password = '',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "name": "${name}",
  "phone": "${phone}",
  "city": "${city}",
  "email": "${email}",
  "fireUserId": "${fireUserId}",
  "userSignType": "${userSignType}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateUsers V One',
      apiUrl: '${baseUrl}/users/profile',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? newTokenFromOldOne(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.newToken''',
      ));
}

class FCMUpdateVOneCall {
  Future<ApiCallResponse> call({
    String? fireUserId = '',
    String? fcmId = '',
    String? deviceType = '',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "fireUserId": "${fireUserId}",
  "fcmId": "${fcmId}",
  "deviceType": "${deviceType}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'FCM Update V One',
      apiUrl: '${baseUrl}/users/firedata',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? newTokenFromOldOne(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.newToken''',
      ));
}

class GetTheBreadOfLifeCall {
  Future<ApiCallResponse> call({
    String? date = '',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetTheBreadOfLife',
      apiUrl: '${baseUrl}/posts/daily-bread?date=${date}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'Date': date,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteUserApiVOneCall {
  Future<ApiCallResponse> call({
    String? userID = '',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete User Api V One',
      apiUrl: '${baseUrl}/users/${userID}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ContactUsVOneCall {
  Future<ApiCallResponse> call({
    String? fireUserId = '',
    String? name = '',
    String? email = '',
    String? phone = '',
    String? message = '',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "fireUserId": "${fireUserId}",
  "name": "${name}",
  "email": "${email}",
  "phone": "${phone}",
  "message": "${message}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Contact Us V One',
      apiUrl: '${baseUrl}/contactus',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? newTokenFromOldOne(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.newToken''',
      ));
}

class DeleteAnonymousVOneCall {
  Future<ApiCallResponse> call({
    String? userID = '',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Anonymous V One',
      apiUrl: '${baseUrl}/users/permenant/${userID}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'UserID': userID,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GoogleLoginVOneCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? password = '',
    String? fireUserId = '',
    String? userSignType = '',
    String? ipAddress = '',
    String? firstDeviceType = '',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "name": "${name}",
  "email": "${email}",
  "password": "${password}",
  "fireUserId": "${fireUserId}",
  "userSignType": "${userSignType}",
  "ipAddress": "${ipAddress}",
  "firstDeviceType": "${firstDeviceType}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GoogleLogin V One',
      apiUrl: '${baseUrl}/auth/signup/google',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? signupTokenResponse(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.token''',
      ));
}

class RecentPostsCall {
  Future<ApiCallResponse> call({
    int? limit = 10,
    int? page,
    String? language = 'en',
    String? categoryId = '',
    String? search = '',
    String? categoryIdExclude = '',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'recentPosts',
      apiUrl:
          '${baseUrl}posts/recents?limit=${limit}&page=${page}&lang=${language}&categoryId=${categoryId}&search=${search}&categoryIdExclude=${categoryIdExclude}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'Limit': limit,
        'Page': page,
        'Language': language,
        'CategoryId': categoryId,
        'Search': search,
        'CategoryIdExclude': categoryIdExclude,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCategoriesHomeVOneCall {
  Future<ApiCallResponse> call({
    bool? includeSubcategories = false,
    String? type = '',
    String? parentCategory = '',
    bool? root = true,
    int? page = 0,
    int? limit = 10,
    String? publishedBefore = '',
    String? sortBy = 'publishedAt',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetCategoriesHome V One',
      apiUrl: '${baseUrl}/categories/home',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'includeSubcategories': includeSubcategories,
        'type': type,
        'parentCategory': parentCategory,
        'root': root,
        'page': page,
        'limit': limit,
        'publishedBefore': publishedBefore,
        'sortBy': sortBy,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? categoryName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? categoryDescription(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? categoryImage(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].thumbnailUrl''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? categoryType(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? hasSubCategory(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].hasSubCategories''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<String>? categoryId(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? newTokenFromOldOne(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.newToken''',
      ));
}

class LoginUpdateTokenVOneCall {
  Future<ApiCallResponse> call({
    String? fireUserId = '',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "fireUserId": "${escapeStringForJson(fireUserId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'loginUpdateToken V One',
      apiUrl: '${baseUrl}/auth/login',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? newTokenFromOldOne(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.token''',
      ));
}

class RadioUrlCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusAPIGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Radio Url',
      apiUrl: '${baseUrl}/radio',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? radioUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.url''',
      ));
  List<String>? radioUrlLList(dynamic response) => (getJsonField(
        response,
        r'''$.data.urls''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? newTokenFromOldOne(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.newToken''',
      ));
}

/// End  St Athanasius API Group Code

/// Start  St Athanasius Version Two Group Code

class StAthanasiusVersionTwoGroup {
  static String getBaseUrl({
    String? jwt = '',
  }) =>
      'https://api.goodshepherdmail.com/api';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [jwt]',
  };
  static GetPostsVersionTwoCall getPostsVersionTwoCall =
      GetPostsVersionTwoCall();
  static GetCategoriesVersionTwoCall getCategoriesVersionTwoCall =
      GetCategoriesVersionTwoCall();
  static GetSinglePostVersionTwoCall getSinglePostVersionTwoCall =
      GetSinglePostVersionTwoCall();
  static SignUpVersionTwoCall signUpVersionTwoCall = SignUpVersionTwoCall();
  static UpdateUsersVersionTwoCall updateUsersVersionTwoCall =
      UpdateUsersVersionTwoCall();
  static FCMUpdateVersionTwoCall fCMUpdateVersionTwoCall =
      FCMUpdateVersionTwoCall();
  static GetTheBreadOfLifeVersionTwoCall getTheBreadOfLifeVersionTwoCall =
      GetTheBreadOfLifeVersionTwoCall();
  static DeleteUserApiVersionTwoCall deleteUserApiVersionTwoCall =
      DeleteUserApiVersionTwoCall();
  static ContactUsVersionTwoCall contactUsVersionTwoCall =
      ContactUsVersionTwoCall();
  static DeleteAnonymousVersionTwoCall deleteAnonymousVersionTwoCall =
      DeleteAnonymousVersionTwoCall();
  static GoogleLoginVersionTwoCall googleLoginVersionTwoCall =
      GoogleLoginVersionTwoCall();
  static RecentPostsVersionTwoCall recentPostsVersionTwoCall =
      RecentPostsVersionTwoCall();
  static GetCategoriesHomeVersionTwoCall getCategoriesHomeVersionTwoCall =
      GetCategoriesHomeVersionTwoCall();
  static LoginUpdateTokenCall loginUpdateTokenCall = LoginUpdateTokenCall();
}

class GetPostsVersionTwoCall {
  Future<ApiCallResponse> call({
    int? limit = 10,
    int? page,
    String? language = 'en',
    String? categoryId = '',
    String? search = '',
    String? categoryIdExclude = '',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusVersionTwoGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetPosts Version Two',
      apiUrl:
          '${baseUrl}/posts/v2?limit=${limit}&page=${page}&lang=${language}&categoryId=${categoryId}&search=${search}&categoryIdExclude=${categoryIdExclude}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'Limit': limit,
        'Page': page,
        'Language': language,
        'CategoryId': categoryId,
        'Search': search,
        'CategoryIdExclude': categoryIdExclude,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? postTitleEn(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.posts[:].title.en''',
      ));
  String? postTitleFr(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.posts[:].title.fr''',
      ));
  String? postTitleEs(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.posts[:].title.es''',
      ));
  String? postContentEn(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.posts[:].content.en''',
      ));
  String? postContentFr(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.posts[:].content.fr''',
      ));
  String? postContentEs(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.posts[:].content.es''',
      ));
  String? postId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.posts[:]._id''',
      ));
  String? postType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.posts[:].type''',
      ));
  String? postThumbnailUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.posts[:].thumbnailUrl''',
      ));
  List? postsData(dynamic response) => getJsonField(
        response,
        r'''$.data.posts''',
        true,
      ) as List?;
  List<String>? categoryName(dynamic response) => (getJsonField(
        response,
        r'''$.data.posts[:].categoryId.name.en''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? newTokenFromOldOne(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.newToken''',
      ));
}

class GetCategoriesVersionTwoCall {
  Future<ApiCallResponse> call({
    String? language = 'en',
    int? page,
    int? limit,
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusVersionTwoGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetCategories Version Two',
      apiUrl:
          '${baseUrl}/categories/v2?limit=${limit}&page=${page}&lang=${language}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'Language': language,
        'Limit': limit,
        'Page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? categoryNameEn(dynamic response) => (getJsonField(
        response,
        r'''$.data.categories[:].name.en''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? categoryNameEs(dynamic response) => (getJsonField(
        response,
        r'''$.data.categories[:].name.es''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? categoryNameFr(dynamic response) => (getJsonField(
        response,
        r'''$.data.categories[:].name.fr''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? categoriesData(dynamic response) => getJsonField(
        response,
        r'''$.data.categories''',
        true,
      ) as List?;
  List<String>? categoryDescriptionEn(dynamic response) => (getJsonField(
        response,
        r'''$.data.categories[:].description.en''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? categoryDescriptionEs(dynamic response) => (getJsonField(
        response,
        r'''$.data.categories[:].description.es''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? categoryDescriptionFr(dynamic response) => (getJsonField(
        response,
        r'''$.data.categories[:].description.fr''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? categorySlug(dynamic response) => (getJsonField(
        response,
        r'''$.data.categories[:].slug''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? categoryThumbnailUrl(dynamic response) => (getJsonField(
        response,
        r'''$.data.categories[:].thumbnailUrl''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? newTokenFromOldOne(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.newToken''',
      ));
}

class GetSinglePostVersionTwoCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusVersionTwoGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetSinglePost Version Two',
      apiUrl: '${baseUrl}/posts/v2/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? postTitleEn(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.title.en''',
      ));
  String? postTitleFr(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.title.fr''',
      ));
  String? postTitleEs(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.title.es''',
      ));
  String? postContentEn(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.content.en''',
      ));
  String? postContentFr(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.content.fr''',
      ));
  String? postContentEs(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.content.es''',
      ));
  String? postDataType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.type''',
      ));
  String? postThumbnailUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.thumbnailUrl''',
      ));
  String? postCategoryId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.categoryId''',
      ));
  String? postCreatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.createdAt''',
      ));
  String? newTokenFromOldOne(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.newToken''',
      ));
}

class SignUpVersionTwoCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? password = '',
    String? fireUserId = '',
    String? userSignType = '',
    String? ipAddress = '',
    String? firstDeviceType = '',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusVersionTwoGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "name": "${name}",
  "email": "${email}",
  "password": "${password}",
  "fireUserId": "${fireUserId}",
  "userSignType": "${userSignType}",
  "ipAddress": "${ipAddress}",
  "firstDeviceType": "${firstDeviceType}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SignUp Version Two',
      apiUrl: '${baseUrl}/users/v2/signup',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? signupTokenResponse(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
}

class UpdateUsersVersionTwoCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? phone = '',
    String? city = '',
    String? email = '',
    String? fireUserId = '',
    String? userSignType = '',
    String? password = '',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusVersionTwoGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "name": "${name}",
  "phone": "${phone}",
  "city": "${city}",
  "email": "${email}",
  "fireUserId": "${fireUserId}",
  "userSignType": "${userSignType}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateUsers Version Two',
      apiUrl: '${baseUrl}/users/v2/profile',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? newTokenFromOldOne(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.newToken''',
      ));
}

class FCMUpdateVersionTwoCall {
  Future<ApiCallResponse> call({
    String? fireUserId = '',
    String? fcmId = '',
    String? deviceType = '',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusVersionTwoGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "fireUserId": "${fireUserId}",
  "fcmId": "${fcmId}",
  "deviceType": "${deviceType}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'FCM Update Version Two',
      apiUrl: '${baseUrl}/users/v2/firedata',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? newTokenFromOldOne(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.newToken''',
      ));
}

class GetTheBreadOfLifeVersionTwoCall {
  Future<ApiCallResponse> call({
    String? date = '',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusVersionTwoGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetTheBreadOfLife Version Two',
      apiUrl: '${baseUrl}/posts/v2/daily-bread?date=${date}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'Date': date,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? newTokenFromOldOne(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.newToken''',
      ));
}

class DeleteUserApiVersionTwoCall {
  Future<ApiCallResponse> call({
    String? userID = '',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusVersionTwoGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete User Api Version Two',
      apiUrl: '${baseUrl}/users/v2/${userID}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'UserID': userID,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? newTokenFromOldOne(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.newToken''',
      ));
}

class ContactUsVersionTwoCall {
  Future<ApiCallResponse> call({
    String? fireUserId = '',
    String? name = '',
    String? email = '',
    String? phone = '',
    String? message = '',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusVersionTwoGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "fireUserId": "${fireUserId}",
  "name": "${name}",
  "email": "${email}",
  "phone": "${phone}",
  "message": "${message}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Contact Us Version Two',
      apiUrl: '${baseUrl}/users/v2/contactus',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? newTokenFromOldOne(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.newToken''',
      ));
}

class DeleteAnonymousVersionTwoCall {
  Future<ApiCallResponse> call({
    String? userID = '',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusVersionTwoGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Anonymous Version Two',
      apiUrl: '${baseUrl}/users/v2/appdelete/${userID}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'UserID': userID,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? newTokenFromOldOne(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.newToken''',
      ));
}

class GoogleLoginVersionTwoCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? password = '',
    String? fireUserId = '',
    String? userSignType = '',
    String? ipAddress = '',
    String? firstDeviceType = '',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusVersionTwoGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "name": "${name}",
  "email": "${email}",
  "password": "${password}",
  "fireUserId": "${fireUserId}",
  "userSignType": "${userSignType}",
  "ipAddress": "${ipAddress}",
  "firstDeviceType": "${firstDeviceType}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GoogleLogin Version Two',
      apiUrl: '${baseUrl}/users/v2/signup/google',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? newTokenFromOldOne(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
}

class RecentPostsVersionTwoCall {
  Future<ApiCallResponse> call({
    int? limit = 10,
    int? page,
    String? language = 'en',
    String? categoryId = '',
    String? search = '',
    String? categoryIdExclude = '',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusVersionTwoGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'recentPosts Version Two',
      apiUrl:
          '${baseUrl}/posts/v2/recents?limit=${limit}&page=${page}&lang=${language}&categoryId=${categoryId}&search=${search}&categoryIdExclude=${categoryIdExclude}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'Limit': limit,
        'Page': page,
        'Language': language,
        'CategoryId': categoryId,
        'Search': search,
        'CategoryIdExclude': categoryIdExclude,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? newTokenFromOldOne(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.newToken''',
      ));
}

class GetCategoriesHomeVersionTwoCall {
  Future<ApiCallResponse> call({
    String? language = 'en',
    int? limit,
    int? page,
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusVersionTwoGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetCategoriesHome Version Two',
      apiUrl:
          '${baseUrl}/categories/v2/home?limit=${limit}&page=${page}&lang=${language}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {
        'Language': language,
        'Limit': limit,
        'Page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? newTokenFromOldOne(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.newToken''',
      ));
}

class LoginUpdateTokenCall {
  Future<ApiCallResponse> call({
    String? fireUserId = '',
    String? jwt = '',
  }) async {
    final baseUrl = StAthanasiusVersionTwoGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "fireUserId": "${escapeStringForJson(fireUserId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'loginUpdateToken',
      apiUrl: '${baseUrl}/users/v2/token',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? newTokenFromOldOne(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
}

/// End  St Athanasius Version Two Group Code

class GetCountryApiCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Country Api',
      apiUrl: 'https://countriesnow.space/api/v0.1/countries/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? countryName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].country''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
