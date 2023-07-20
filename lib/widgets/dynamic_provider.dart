import 'dart:async';

import 'package:demo_server_driven_ui/widgets/dynamic_widget.dart';
import 'package:demo_server_driven_ui/widgets/view.dart';
import 'package:flutter/material.dart';

class DynamicProvider extends DynamicWidget {
  final Map<String, dynamic> _stateCache;

  Map<String?, dynamic> get stateCache => _stateCache;

  final DynamicWidget? child;

  DynamicProvider(
    this.child, {
    String key = '',
    Map<String, dynamic>? stateCache,
  })  : _stateCache = stateCache ?? <String, dynamic>{},
        super(key: key) {
    child?.parent = this;
  }

  @override
  Widget build(BuildContext context) {
    return DynamicView(
      child: child,
    );
  }

  @override
  FutureOr invokeMethod(String methodName, {Map<String, dynamic>? params}) {}

  @override
  List<DynamicWidget?>? get childWidgets => [if (child != null) child!];
}
