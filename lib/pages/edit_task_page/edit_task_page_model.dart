import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'edit_task_page_widget.dart' show EditTaskPageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditTaskPageModel extends FlutterFlowModel<EditTaskPageWidget> {
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
        'b9wt0t2t' /* mm/dd/yyyy es necesario */,
      );
    }

    return null;
  }

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
