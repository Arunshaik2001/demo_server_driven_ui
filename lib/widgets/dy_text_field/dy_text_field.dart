import 'dart:async';

import 'package:demo_server_driven_ui/widgets/dynamic_widget.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../widgets/form_widget/form_widget.dart';

part 'dy_text_field.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicTextField extends DynamicWidget implements FormWidget {
  final String initialText;

  DynamicTextField({String? key, required this.initialText}) : super(key: key);

  @override
  List<DynamicWidget?>? get childWidgets => [];

  factory DynamicTextField.fromJson(Map<String, dynamic> json) =>
      _$DynamicTextFieldFromJson(json);

  @JsonKey(includeFromJson: false, includeToJson: false)
  TextEditingController? _textControllerInstance;

  TextEditingController? get _controller {
    _textControllerInstance ??= TextEditingController(text: initialText);
    return _textControllerInstance;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
    );
  }

  @override
  Map<String, dynamic> getValues() {
    return {
      "textFieldData": _controller?.text ?? ''
    };
  }

  @override
  bool validate() {
    if(_controller?.text != null && (_controller?.text.isNotEmpty??false)){
      return true;
    }
    return false;
  }

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}
}
