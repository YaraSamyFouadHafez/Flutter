import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'auth_create_widget.dart' show AuthCreateWidget;
import 'package:flutter/material.dart';

class AuthCreateModel extends FlutterFlowModel<AuthCreateWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DisplayName widget.
  FocusNode? displayNameFocusNode;
  TextEditingController? displayNameTextController;
  String? Function(BuildContext, String?)? displayNameTextControllerValidator;
  String? _displayNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'awfbf4uh' /* Field is required */,
      );
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'px4kfity' /* Wrong Email */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '456ro2lx' /* Password must be 6 character a... */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'zfle9baq' /* Password must be 6 character a... */,
      );
    }

    return null;
  }

  // State field(s) for ConfirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordTextController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;
  String? _confirmPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetConnection2;
  // Stores action output result for [Custom Action - getIPAddress] action in Button widget.
  String? ipAddress;
  // Stores action output result for [Custom Action - getCountryFromIP] action in Button widget.
  String? countryName;
  // Stores action output result for [Backend Call - API (SignUp V One)] action in Button widget.
  ApiCallResponse? authResponse;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetConnection3;
  // Stores action output result for [Custom Action - getCountryFromIP] action in Button widget.
  String? countryNameG;
  // Stores action output result for [Custom Action - getIPAddress] action in Button widget.
  String? ipAddressG;
  // Stores action output result for [Backend Call - API (SignUp V One)] action in Button widget.
  ApiCallResponse? googleAuthResponse;
  // Stores action output result for [Custom Action - checkInternetConnection] action in Button widget.
  bool? internetConnection4;
  // Stores action output result for [Custom Action - getIPAddress] action in Button widget.
  String? ipAddressA;
  // Stores action output result for [Custom Action - getCountryFromIP] action in Button widget.
  String? countryNameA;
  // Stores action output result for [Backend Call - API (SignUp V One)] action in Button widget.
  ApiCallResponse? anonymousAuthResponse;

  @override
  void initState(BuildContext context) {
    displayNameTextControllerValidator = _displayNameTextControllerValidator;
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    confirmPasswordVisibility = false;
    confirmPasswordTextControllerValidator =
        _confirmPasswordTextControllerValidator;
  }

  @override
  void dispose() {
    displayNameFocusNode?.dispose();
    displayNameTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordTextController?.dispose();
  }
}
