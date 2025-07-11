import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profilepage_widget.dart' show ProfilepageWidget;
import 'package:flutter/material.dart';

class ProfilepageModel extends FlutterFlowModel<ProfilepageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for OldPasswordInput widget.
  FocusNode? oldPasswordInputFocusNode;
  TextEditingController? oldPasswordInputTextController;
  late bool oldPasswordInputVisibility;
  String? Function(BuildContext, String?)?
      oldPasswordInputTextControllerValidator;
  String? _oldPasswordInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9ge2rit1' /* Contraseña is required */,
      );
    }

    return null;
  }

  // State field(s) for NewPassword widget.
  FocusNode? newPasswordFocusNode1;
  TextEditingController? newPasswordTextController1;
  late bool newPasswordVisibility1;
  String? Function(BuildContext, String?)? newPasswordTextController1Validator;
  String? _newPasswordTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hpkildl4' /* Se requiere contraseña */,
      );
    }

    if (val.length < 7) {
      return FFLocalizations.of(context).getText(
        'qnnp1jc8' /* Al menos 7 numeros o letras */,
      );
    }

    if (!RegExp('^(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d]{8,}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'w4b261t2' /* Se requiere mayuscula */,
      );
    }
    return null;
  }

  // State field(s) for NewPassword widget.
  FocusNode? newPasswordFocusNode2;
  TextEditingController? newPasswordTextController2;
  late bool newPasswordVisibility2;
  String? Function(BuildContext, String?)? newPasswordTextController2Validator;
  String? _newPasswordTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xv86bwbr' /* Se requiere contraseña */,
      );
    }

    return null;
  }

  // Stores action output result for [Custom Action - encryptText] action in Save widget.
  String? oldpass;
  // Stores action output result for [Firestore Query - Query a collection] action in Save widget.
  UsersRecord? passwordsss;
  // Stores action output result for [Custom Action - encryptText] action in Save widget.
  String? newPassword;
  // Stores action output result for [Custom Action - encryptText] action in botonBorra widget.
  String? passwords;
  // Stores action output result for [Firestore Query - Query a collection] action in botonBorra widget.
  UsersRecord? firebase;

  @override
  void initState(BuildContext context) {
    oldPasswordInputVisibility = false;
    oldPasswordInputTextControllerValidator =
        _oldPasswordInputTextControllerValidator;
    newPasswordVisibility1 = false;
    newPasswordTextController1Validator = _newPasswordTextController1Validator;
    newPasswordVisibility2 = false;
    newPasswordTextController2Validator = _newPasswordTextController2Validator;
  }

  @override
  void dispose() {
    oldPasswordInputFocusNode?.dispose();
    oldPasswordInputTextController?.dispose();

    newPasswordFocusNode1?.dispose();
    newPasswordTextController1?.dispose();

    newPasswordFocusNode2?.dispose();
    newPasswordTextController2?.dispose();
  }
}
