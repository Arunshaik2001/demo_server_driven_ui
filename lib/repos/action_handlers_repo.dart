import 'package:demo_server_driven_ui/dtos/action_dto.dart';
import 'package:demo_server_driven_ui/widgets/dynamic_widget.dart';
import 'package:demo_server_driven_ui/action_handlers/form_action_handler/form_action_handler.dart';
import 'package:demo_server_driven_ui/action_handlers/move_to_screen_action_handler/move_to_screen_action_handler.dart';
import 'package:flutter/material.dart';
import 'package:demo_server_driven_ui/action_handlers/action_handler.dart';

final RegExp _MOVE_TO_SCREEN = RegExp(r'(^/?moveToScreen/?$)');
final RegExp _FORM = RegExp(r'(^/?form/?$)');

class ActionHandlersRepo {
  static Map<RegExp, ActionHandler> handlers = Map();
  static BuildContext? context;

  static void _registerHandler(RegExp type, ActionHandler handler) {
    handlers[type] = handler;
  }

  static void init() {
    _registerHandler(_MOVE_TO_SCREEN, MoveToScreenActorHandler());
    _registerHandler(_FORM, FormActionHandler());
  }

  static void handle(ActionDTO actionDTO, DynamicWidget widget) {
    bool hasMatched = false;
    if (actionDTO.actionString != null) {
      Uri action = Uri.parse(actionDTO.actionString!);
      handlers.forEach((key, handler) {
        if (!hasMatched) {
          if (key.hasMatch(action.path)) {
            Map<String, dynamic> extras = {
              "_instance": widget
            };
            if(actionDTO.extras != null) {
              extras.addAll(actionDTO.extras!);
            }
            handler.handleAction(context, action, extras);
            hasMatched = true;
          }
        }
      });
    }
  }
}
