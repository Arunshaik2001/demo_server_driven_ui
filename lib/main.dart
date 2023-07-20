import 'dart:convert';
import 'package:demo_server_driven_ui/widgets/dynamic_provider.dart';
import 'package:demo_server_driven_ui/widgets/dynamic_widget.dart';
import 'package:demo_server_driven_ui/repos/action_handlers_repo.dart';
import 'package:demo_server_driven_ui/action_handlers/action_handler.dart';
import 'package:demo_server_driven_ui/widgets/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dynamic_widget/dynamic_widget_handlers.dart';

void main() {
  DynamicWidgetHandlers.init();
  ActionHandlersRepo.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic>? jsonWidget;

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  void loadJson() async {
    final String data = await rootBundle.loadString('assets/json/sample1.json');
    final Map<String, dynamic> json = jsonDecode(data);
    jsonWidget = json;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ActionHandlersRepo.context = context;
    if (jsonWidget != null) {
      return DynamicProvider(DynamicWidget.fromJson(jsonWidget!))
          .build(context);
    }
    return const SizedBox.shrink();
  }
}
