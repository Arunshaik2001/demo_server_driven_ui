import 'dart:convert';
import 'package:demo_server_driven_ui/dynamic_widget.dart';
import 'package:demo_server_driven_ui/dynamic_widget_handlers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  DynamicWidgetHandlers.init();
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
  DynamicWidget? dynamicWidget;

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  void loadJson() async {
    final String data = await rootBundle.loadString('assets/json/sample.json');
    final Map<String, dynamic> json = jsonDecode(data);
    dynamicWidget = DynamicWidget.fromJson(json);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (dynamicWidget != null)
                dynamicWidget!.build(context)
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
