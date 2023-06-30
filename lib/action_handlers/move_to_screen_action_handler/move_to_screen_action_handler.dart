import 'dart:convert';

import 'package:demo_server_driven_ui/action_handlers/action_handler.dart';
import 'package:demo_server_driven_ui/utils/widget_util.dart';
import 'package:demo_server_driven_ui/widgets/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MoveToScreenActorHandler extends ActionHandler {
  @override
  void handleAction(
      BuildContext? context, Uri action, Map<String, dynamic>? extras) {
    if (extras != null) {
      if (extras['urlType'] == 'local') {
        WidgetUtil.loadJson(extras['url']).then((value) {
          if (extras['navigationType'] == 'replace') {
            Navigator.of(context!)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return DynamicView(json: value);
            }));
          } else {
            Navigator.of(context!).push(MaterialPageRoute(builder: (context) {
              return DynamicView(json: value);
            }));
          }
        });
      }
    } else {
      if (action.queryParameters['screenName'] != null) {
        Navigator.of(context!).pushNamed(action.queryParameters['screenName']!);

      }
    }
  }
}
