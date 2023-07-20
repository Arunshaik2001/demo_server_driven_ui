import 'package:demo_server_driven_ui/widgets/dynamic_widget.dart';
import 'package:demo_server_driven_ui/widgets/form_widget/form_widget.dart';
import 'package:flutter/material.dart';

class DynamicView extends StatelessWidget {
  Map<String, dynamic>? json;
  DynamicWidget? child;

  DynamicView({Key? key, this.json, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DynamicWidget? widget =  child;
    if(child == null){
      widget = DynamicWidget.fromJson(json!);
    }

    return Container(
      child: widget!.build(context),
    );
  }
}
