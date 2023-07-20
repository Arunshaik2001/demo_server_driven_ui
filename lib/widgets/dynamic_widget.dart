import 'dart:async';

import 'package:demo_server_driven_ui/constants/constants.dart';
import 'package:demo_server_driven_ui/repos/dynamic_widget_handler_repo.dart';
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

  Widget build(BuildContext context);

  factory DynamicWidget.fromJson(Map<String, dynamic> json) {
    try {
      String type = json['type'];
      DynamicWidgetHandler? dynamicWidgetHandler =
          DynamicWidgetHandlerRepo.getDynamicWidgetHandlerForType(type);
      if (dynamicWidgetHandler != null && json.containsKey("data")) {
        DynamicWidget widget = dynamicWidgetHandler(json["data"]);
        List<DynamicWidget?>? children = widget.childWidgets;
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

  FutureOr<dynamic> invokeMethod(
    String methodName, {
    Map<String, dynamic>? params,
  });

  List<DynamicWidget?>? get childWidgets;
}
