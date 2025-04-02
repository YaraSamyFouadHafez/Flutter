import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'oldsub_categories_page_widget.dart' show OldsubCategoriesPageWidget;
import 'package:flutter/material.dart';

class OldsubCategoriesPageModel
    extends FlutterFlowModel<OldsubCategoriesPageWidget> {
  ///  Local state fields for this page.

  String? categorySlugState;

  /// Query cache managers for this widget.

  final _subCatPageManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> subCatPage({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _subCatPageManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSubCatPageCache() => _subCatPageManager.clear();
  void clearSubCatPageCacheKey(String? uniqueKey) =>
      _subCatPageManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearSubCatPageCache();
  }
}
