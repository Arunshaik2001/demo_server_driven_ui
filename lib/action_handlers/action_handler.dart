import 'package:flutter/material.dart';

abstract class ActionHandler {
  void handleAction(
    BuildContext? context,
    Uri action,
    Map<String, dynamic>? extras,
  );
}
