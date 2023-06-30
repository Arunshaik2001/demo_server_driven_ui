import 'package:demo_server_driven_ui/widgets/dynamic_widget.dart';
import 'package:demo_server_driven_ui/widgets/form_widget/form_widget.dart';
import 'package:flutter/material.dart';

class DynamicView extends StatelessWidget {
  Map<String, dynamic> json;

  DynamicView({Key? key, required this.json}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DynamicWidget dynamicWidget = DynamicWidget.fromJson(json);
    Widget widget = dynamicWidget.build(context);
    return Container(
      child: widget,
    );
  }
}
