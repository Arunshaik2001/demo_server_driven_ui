import 'package:demo_server_driven_ui/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:demo_server_driven_ui/dynamic_widget.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dynamic_text.g.dart';

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

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: style,
      key: ValueKey(key),
    );
  }

  @override
  List<DynamicWidget?>? get childWidgets => [];
}
