import 'package:demo_server_driven_ui/widgets/dynamic_widget.dart';
import 'package:demo_server_driven_ui/action_handlers/action_handler.dart';
import 'package:demo_server_driven_ui/widgets/form_widget/form_widget.dart';
import 'package:demo_server_driven_ui/resolvers/widget_resolver.dart';
import 'package:flutter/material.dart';

class FormActionHandler extends ActionHandler {
  @override
  void handleAction(
      BuildContext? context, Uri action, Map<String, dynamic>? extras) {
    if (extras != null && extras.containsKey('_instance')) {
      DynamicWidget widget = extras['_instance'];
      FormWidget? formWidget =
          WidgetResolver.getTopAncestorOfType<FormWidget>(widget);
      if (formWidget?.validate() ?? false) {
        //do your stuff
        print('FormEventEventHandler ${formWidget?.getValues()}');
      }
    }
  }
}
