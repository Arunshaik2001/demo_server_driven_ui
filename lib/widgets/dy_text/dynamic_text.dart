import 'dart:async';

import 'package:demo_server_driven_ui/utils/widget_util.dart';
import 'package:demo_server_driven_ui/widgets/dy_text/dynamic_text_state.dart';
import 'package:demo_server_driven_ui/widgets/dynamic_provider.dart';
import 'package:flutter/material.dart';
import 'package:demo_server_driven_ui/widgets/dynamic_widget.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../resolvers/widget_resolver.dart';

part 'dynamic_text.g.dart';

const String UPDATE_TEXT = 'UPDATE_TEXT';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicText extends DynamicWidget {
  String? text;
  @JsonKey(fromJson: WidgetUtil.getTextStyle)
  TextStyle? style;

  DynamicText({
    String? key,
    this.text,
  }) : super(
          key: key ?? "",
        );

  factory DynamicText.fromJson(Map<String, dynamic> json) =>
      _$DynamicTextFromJson(json);

  DynamicTextState? __dynamicTextState;

  DynamicTextState get _dynamicTextState {
    DynamicProvider dynamicProvider =
        WidgetResolver.getTopAncestorOfType<DynamicProvider>(this)!;
    if (__dynamicTextState != null) {
      return __dynamicTextState!;
    } else {
      if (key == null) {
        __dynamicTextState = DynamicTextState(text);
      } else {
        __dynamicTextState = dynamicProvider.stateCache.putIfAbsent(
          key,
          () => DynamicTextState(text),
        ) as DynamicTextState?;
      }
    }
    return __dynamicTextState!;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _dynamicTextState.textNotifier,
      builder: (BuildContext context, String? text, Widget? child) {
        return Text(
          text ?? '',
          style: style,
          key: ValueKey(key),
        );
      },
    );
  }

  @override
  List<DynamicWidget?>? get childWidgets => [];

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {
    switch (methodName) {
      case UPDATE_TEXT:
        String newText = params?['newText'];
        _dynamicTextState.updateTitle(newText);
    }
  }
}
