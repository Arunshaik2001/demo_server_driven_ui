import 'dart:convert';

import 'package:demo_server_driven_ui/action_handlers/action_handler.dart';
import 'package:demo_server_driven_ui/resolvers/widget_resolver.dart';
import 'package:demo_server_driven_ui/utils/widget_util.dart';
import 'package:demo_server_driven_ui/widgets/dynamic_provider.dart';
import 'package:demo_server_driven_ui/widgets/dynamic_widget.dart';
import 'package:demo_server_driven_ui/widgets/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpdateWidgetActionHandler extends ActionHandler {
  @override
  void handleAction(
      BuildContext? context, Uri action, Map<String, dynamic>? extras) {
    if (extras != null) {
      String widgetKey = extras['widgetKey'];
      DynamicWidget widget = extras['_instance'];
      DynamicWidget? screenWidget = WidgetResolver.getRoot(widget);

      if (screenWidget != null) {
        String methodName = extras['methodName'];
        Map<String, dynamic> params = extras['params'];
        DynamicWidget? updateWidget =
            WidgetResolver.getWidgetWithKey(screenWidget, widgetKey);
        updateWidget?.invokeMethod(methodName, params: params);
      }
    }
  }
}
