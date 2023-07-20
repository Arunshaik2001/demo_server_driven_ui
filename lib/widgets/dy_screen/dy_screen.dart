import 'dart:async';

import 'package:demo_server_driven_ui/widgets/form_widget/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:demo_server_driven_ui/widgets/dynamic_widget.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dy_screen.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DynamicScreen extends DynamicWidget implements FormWidget {
  String pageTitle;
  DynamicWidget? child;

  DynamicScreen({String? key, this.child, required this.pageTitle})
      : super(
          key: key ?? "",
        );

  factory DynamicScreen.fromJson(Map<String, dynamic> json) =>
      _$DynamicScreenFromJson(json);

  @override
  List<DynamicWidget?>? get childWidgets => child != null ? [child!] : [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey(key),
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: child?.build(context),
    );
  }

  @override
  Map<String, dynamic> getValues() {
    return getValuesFromChild(child);
  }

  Map<String, dynamic> getValuesFromChild(DynamicWidget? widget) {
    if (widget != null) {
      if (widget is FormWidget) {
        return (widget as FormWidget).getValues();
      } else {
        if (widget.childWidgets?.isNotEmpty ?? false) {
          Map<String, dynamic> map = {};
          for (var child in widget.childWidgets!) {
            if (child != null) {
              var childMap = getValuesFromChild(child);
              childMap.forEach((key, value) {
                if (map.containsKey(key)) {
                  if (map[key] is List) {
                    map[key]?.add(value);
                  } else {
                    map[key] = [map[key], value];
                  }
                } else {
                  map[key] = value;
                }
              });
            }
          }
          return map;
        }
        return {};
      }
    } else {
      return {};
    }
  }

  @override
  bool validate() {
    return validateFormWidgets(child);
  }

  bool validateFormWidgets(DynamicWidget? widget) {
    if (widget != null) {
      if (widget is FormWidget) {
        return (widget as FormWidget).validate();
      } else {
        if (widget.childWidgets?.isNotEmpty ?? false) {
          bool validate = true;
          for (var child in widget.childWidgets!) {
            if (child != null) {
              validate = validate && validateFormWidgets(child);
            }
          }
          return validate;
        }
        return true;
      }
    } else {
      return true;
    }
  }

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}
}
