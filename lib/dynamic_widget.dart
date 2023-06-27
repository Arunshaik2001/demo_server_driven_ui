import 'package:demo_server_driven_ui/constants/constants.dart';
import 'package:demo_server_driven_ui/widget_resolver_map.dart';
import 'package:demo_server_driven_ui/widgets/dy_container/dynamic_container.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createToJson: false, createFactory: false)
abstract class DynamicWidget {
  @JsonKey(required: true)
  final String? key;

  @JsonKey(includeFromJson: false, includeToJson: false)
  DynamicWidget? parent;

  DynamicWidget({required this.key, this.parent});

  Widget build(BuildContext context) {
    return Container();
  }

  factory DynamicWidget.fromJson(Map<String, dynamic> json) {
    try {
      String type = json['type'];
      DynamicWidgetHandler? dynamicWidgetHandler =
          DynamicWidgetHandlerRepo.getDynamicWidgetHandlerForType(type);
      if (dynamicWidgetHandler != null && json.containsKey("data")) {
        DynamicWidget widget = dynamicWidgetHandler(json["data"]);
        List<DynamicWidget?>? children = widget.childElements;
        children?.forEach((element) {
          element?.parent = widget;
        });

        return widget;
      } else {
        debugPrint('failed to create dynamic widget');
        return DynamicContainer(width: 0.0);
      }
    } catch (e) {
      debugPrint('failed to create dynamic widget');
      return DynamicContainer(width: 0.0);
    }
  }

  List<DynamicWidget?>? get childElements;
}
