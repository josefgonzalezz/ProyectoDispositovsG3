import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'sign_up_page_widget.dart' show SignUpPageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpPageModel extends FlutterFlowModel<SignUpPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey5 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for EmailInput widget.
  FocusNode? emailInputFocusNode;
  TextEditingController? emailInputTextController;
  String? Function(BuildContext, String?)? emailInputTextControllerValidator;
  String? _emailInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '36n7iuz4' /* Se requiere dirección de corre... */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'luvrn6db' /* Se necesita un gmail valido */,
      );
    }
    return null;
  }

  // State field(s) for PasswordInput widget.
  FocusNode? passwordInputFocusNode;
  TextEditingController? passwordInputTextController;
  late bool passwordInputVisibility;
  String? Function(BuildContext, String?)? passwordInputTextControllerValidator;
  String? _passwordInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rexeqq0m' /* Se requiere contraseña */,
      );
    }

    if (val.length < 7) {
      return FFLocalizations.of(context).getText(
        'tsxci53c' /*  al menos 7+ numeros o letras */,
      );
    }

    if (!RegExp('^(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d]{8,}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'x4x9rz9l' /* Se requiere mayuscula */,
      );
    }
    return null;
  }

  // State field(s) for ConfiurmPasswordInput widget.
  FocusNode? confiurmPasswordInputFocusNode;
  TextEditingController? confiurmPasswordInputTextController;
  late bool confiurmPasswordInputVisibility;
  String? Function(BuildContext, String?)?
      confiurmPasswordInputTextControllerValidator;
  String? _confiurmPasswordInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '46iq3pnv' /* Es necesario que confirme  la ... */,
      );
    }

    return null;
  }

  // State field(s) for NicknameInput widget.
  FocusNode? nicknameInputFocusNode;
  TextEditingController? nicknameInputTextController;
  String? Function(BuildContext, String?)? nicknameInputTextControllerValidator;
  String? _nicknameInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1a7o0j7f' /* El apodo es necesario  */,
      );
    }

    if (val.length < 3) {
      return FFLocalizations.of(context).getText(
        'wagwg2zv' /* El minimo de letras es de 3 */,
      );
    }
    if (val.length > 10) {
      return FFLocalizations.of(context).getText(
        'wva6ekki' /* El maximo de letras es de 10 */,
      );
    }
    if (!RegExp('^[a-zA-Z]{3,20}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '98ckx6ut' /* solo letras, sin espacios */,
      );
    }
    return null;
  }

  // State field(s) for BirthdateInput widget.
  FocusNode? birthdateInputFocusNode;
  TextEditingController? birthdateInputTextController;
  late MaskTextInputFormatter birthdateInputMask;
  String? Function(BuildContext, String?)?
      birthdateInputTextControllerValidator;
  String? _birthdateInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'b3zrf5y5' /* mm/dd/yyyy es necesario */,
      );
    }

    return null;
  }

  // Stores action output result for [Custom Action - parseDate] action in SubmitButton widget.
  DateTime? birthdate;
  // Stores action output result for [Custom Action - encryptText] action in SubmitButton widget.
  String? passwordd;
  // Stores action output result for [Backend Call - Create Document] action in SubmitButton widget.
  UsersRecord? resultt;
  // Stores action output result for [Backend Call - API (CreateJWT)] action in SubmitButton widget.
  ApiCallResponse? apiResult;

  @override
  void initState(BuildContext context) {
    emailInputTextControllerValidator = _emailInputTextControllerValidator;
    passwordInputVisibility = false;
    passwordInputTextControllerValidator =
        _passwordInputTextControllerValidator;
    confiurmPasswordInputVisibility = false;
    confiurmPasswordInputTextControllerValidator =
        _confiurmPasswordInputTextControllerValidator;
    nicknameInputTextControllerValidator =
        _nicknameInputTextControllerValidator;
    birthdateInputTextControllerValidator =
        _birthdateInputTextControllerValidator;
  }

  @override
  void dispose() {
    emailInputFocusNode?.dispose();
    emailInputTextController?.dispose();

    passwordInputFocusNode?.dispose();
    passwordInputTextController?.dispose();

    confiurmPasswordInputFocusNode?.dispose();
    confiurmPasswordInputTextController?.dispose();

    nicknameInputFocusNode?.dispose();
    nicknameInputTextController?.dispose();

    birthdateInputFocusNode?.dispose();
    birthdateInputTextController?.dispose();
  }
}
