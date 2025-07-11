import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'create_task_widget.dart' show CreateTaskWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateTaskModel extends FlutterFlowModel<CreateTaskWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey3 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for subjectInput widget.
  FocusNode? subjectInputFocusNode;
  TextEditingController? subjectInputTextController;
  String? Function(BuildContext, String?)? subjectInputTextControllerValidator;
  // State field(s) for descriptionInput widget.
  FocusNode? descriptionInputFocusNode;
  TextEditingController? descriptionInputTextController;
  String? Function(BuildContext, String?)?
      descriptionInputTextControllerValidator;
  // State field(s) for dueDateInput widget.
  FocusNode? dueDateInputFocusNode;
  TextEditingController? dueDateInputTextController;
  late MaskTextInputFormatter dueDateInputMask;
  String? Function(BuildContext, String?)? dueDateInputTextControllerValidator;
  String? _dueDateInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lefoebkh' /* mm/dd/yyyy es necesario */,
      );
    }

    return null;
  }

  // Stores action output result for [Custom Action - parseDate] action in Button widget.
  DateTime? parsedate;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TasksRecord? apiResult;

  @override
  void initState(BuildContext context) {
    dueDateInputTextControllerValidator = _dueDateInputTextControllerValidator;
  }

  @override
  void dispose() {
    subjectInputFocusNode?.dispose();
    subjectInputTextController?.dispose();

    descriptionInputFocusNode?.dispose();
    descriptionInputTextController?.dispose();

    dueDateInputFocusNode?.dispose();
    dueDateInputTextController?.dispose();
  }
}
