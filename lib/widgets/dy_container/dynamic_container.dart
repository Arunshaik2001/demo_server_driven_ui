import 'package:demo_server_driven_ui/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:demo_server_driven_ui/widgets/dynamic_widget.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dynamic_container.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicContainer extends DynamicWidget {
  String? backgroundColor;
  double? padding;
  double? margin;
  double? height;
  double? width;
  DynamicWidget? child;
  @JsonKey(fromJson: WidgetUtil.getPositionalAlignment)
  Alignment? alignment;

  DynamicContainer({
    String? key,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.height,
    this.width,
    this.child,
    this.alignment,
  }) : super(
          key: key ?? "",
        );

  factory DynamicContainer.fromJson(Map<String, dynamic> json) =>
      _$DynamicContainerFromJson(json);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(key),
      color:
          backgroundColor != null ? Color(int.parse(backgroundColor!)) : null,
      padding: padding != null ? EdgeInsets.all(padding!) : EdgeInsets.zero,
      margin: margin != null ? EdgeInsets.all(margin!) : EdgeInsets.zero,
      height: height,
      width: width,
      alignment: alignment ?? Alignment.center,
      child: child?.build(
        context,
      ),
    );
  }

  @override
  List<DynamicWidget?>? get childWidgets => child == null ? [] : [child!];
}
