import 'package:demo_server_driven_ui/widgets/dynamic_widget.dart';
import 'package:demo_server_driven_ui/action_handlers/action_handler.dart';
import 'package:demo_server_driven_ui/repos/action_handlers_repo.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:demo_server_driven_ui/dtos/action_dto.dart';

part 'dy_button.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicButton extends DynamicWidget {
  DynamicWidget child;
  ActionDTO? action;

  DynamicButton({String? key, required this.child, this.action}) : super(key: key);

  @override
  List<DynamicWidget?>? get childWidgets => [child];

  factory DynamicButton.fromJson(Map<String, dynamic> json) =>
      _$DynamicButtonFromJson(json);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          if(action != null){
            ActionHandlersRepo.handle(action!, this);
          }
        },
        child: Center(
          child: child.build(context),
        ));
  }

}
