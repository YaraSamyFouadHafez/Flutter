import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import 'package:ff_commons/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _AppVersionNumber =
          prefs.getInt('ff_AppVersionNumber') ?? _AppVersionNumber;
    });
    _safeInit(() {
      _SkipUpdate = prefs.getBool('ff_SkipUpdate') ?? _SkipUpdate;
    });
    _safeInit(() {
      _fcmAppState = prefs.getString('ff_fcmAppState') ?? _fcmAppState;
    });
    _safeInit(() {
      _token = prefs.getString('ff_token') ?? _token;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _AppVersionNumber = 20;
  int get AppVersionNumber => _AppVersionNumber;
  set AppVersionNumber(int value) {
    _AppVersionNumber = value;
    prefs.setInt('ff_AppVersionNumber', value);
  }

  bool _SkipUpdate = false;
  bool get SkipUpdate => _SkipUpdate;
  set SkipUpdate(bool value) {
    _SkipUpdate = value;
    prefs.setBool('ff_SkipUpdate', value);
  }

  bool _connected = false;
  bool get connected => _connected;
  set connected(bool value) {
    _connected = value;
  }

  String _fcmAppState = '';
  String get fcmAppState => _fcmAppState;
  set fcmAppState(String value) {
    _fcmAppState = value;
    prefs.setString('ff_fcmAppState', value);
  }

  String _notificationTitle = '';
  String get notificationTitle => _notificationTitle;
  set notificationTitle(String value) {
    _notificationTitle = value;
  }

  String _notificationMessage = '';
  String get notificationMessage => _notificationMessage;
  set notificationMessage(String value) {
    _notificationMessage = value;
  }

  String _notificationType = '';
  String get notificationType => _notificationType;
  set notificationType(String value) {
    _notificationType = value;
  }

  String _token = '';
  String get token => _token;
  set token(String value) {
    _token = value;
    prefs.setString('ff_token', value);
  }

  String _InitialURL = 'https://almasryeen.org:8443/main.mp3';
  String get InitialURL => _InitialURL;
  set InitialURL(String value) {
    _InitialURL = value;
  }

  String _currentURL = '';
  String get currentURL => _currentURL;
  set currentURL(String value) {
    _currentURL = value;
  }

  List<String> _MusicUrls = ['https://almasryeen.org:8443/main.mp3'];
  List<String> get MusicUrls => _MusicUrls;
  set MusicUrls(List<String> value) {
    _MusicUrls = value;
  }

  void addToMusicUrls(String value) {
    MusicUrls.add(value);
  }

  void removeFromMusicUrls(String value) {
    MusicUrls.remove(value);
  }

  void removeAtIndexFromMusicUrls(int index) {
    MusicUrls.removeAt(index);
  }

  void updateMusicUrlsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    MusicUrls[index] = updateFn(_MusicUrls[index]);
  }

  void insertAtIndexInMusicUrls(int index, String value) {
    MusicUrls.insert(index, value);
  }

  final _catQueryManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> catQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _catQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCatQueryCache() => _catQueryManager.clear();
  void clearCatQueryCacheKey(String? uniqueKey) =>
      _catQueryManager.clearRequest(uniqueKey);

  final _latestPostsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> latestPosts({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _latestPostsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearLatestPostsCache() => _latestPostsManager.clear();
  void clearLatestPostsCacheKey(String? uniqueKey) =>
      _latestPostsManager.clearRequest(uniqueKey);

  final _todayBreadOfLifeManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> todayBreadOfLife({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _todayBreadOfLifeManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTodayBreadOfLifeCache() => _todayBreadOfLifeManager.clear();
  void clearTodayBreadOfLifeCacheKey(String? uniqueKey) =>
      _todayBreadOfLifeManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
