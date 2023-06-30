import 'package:demo_server_driven_ui/widgets/dynamic_widget.dart';
import 'package:flutter/foundation.dart';

class WidgetResolver {
  static T? getTopAncestorOfType<T>(DynamicWidget widget) {
    DynamicWidget? child = widget.parent;
    T? topAncestor;
    while (child != null) {
      if (child is T) {
        topAncestor = child as T?;
      }
      child = child.parent;
    }
    return topAncestor;
  }
}
