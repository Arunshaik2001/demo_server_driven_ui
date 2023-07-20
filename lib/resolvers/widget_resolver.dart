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

  static DynamicWidget? getRoot(DynamicWidget? child) {
    DynamicWidget? root;
    while (child?.parent != null) {
      root = child?.parent;
      child = child?.parent;
    }
    return root;
  }

  static DynamicWidget? getWidgetWithKey(
      DynamicWidget root,
      String key,
      ) {
    DynamicWidget? matchedElement;
    if (root.key?.compareTo(key) == 0) {
      matchedElement = root;
    } else {

      if (root.childWidgets?.isNotEmpty ?? false) {
        for (int i = 0; i < (root.childWidgets?.length ?? 0); i++) {
          DynamicWidget? internalMatchedElement = getWidgetWithKey(root.childWidgets![i]!, key);
          if (internalMatchedElement != null) {
            matchedElement = internalMatchedElement;
            break;
          }
        }
      }
    }
    return matchedElement;
  }
}
