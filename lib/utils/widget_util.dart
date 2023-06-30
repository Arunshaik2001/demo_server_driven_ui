import 'dart:convert';

import 'package:demo_server_driven_ui/constants/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class WidgetUtil {
  static Alignment? getPositionalAlignment(String? alignment) {
    if (alignment != null && alignment.isNotEmpty) {
      switch (alignment) {
        case "center":
          return Alignment.center;
        case "centerLeft":
          return Alignment.centerLeft;
        case "centerRight":
          return Alignment.centerRight;
        case "topCenter":
          return Alignment.topCenter;
        case "bottomCenter":
          return Alignment.bottomCenter;
      }
    }
    return null;
  }

  static MainAxisAlignment? getMainAxisAlignment(String? alignment) {
    if (alignment != null && alignment.isNotEmpty) {
      switch (alignment) {
        case "center":
          return MainAxisAlignment.center;
        case "start":
          return MainAxisAlignment.start;
        case "end":
          return MainAxisAlignment.end;
        case "spaceBetween":
          return MainAxisAlignment.spaceBetween;
        case "spaceAround":
          return MainAxisAlignment.spaceAround;
        case "spaceEvenly":
          return MainAxisAlignment.spaceEvenly;
      }
    }
    return null;
  }

  static CrossAxisAlignment? getCrossAxisAlignment(String? alignment) {
    if (alignment != null && alignment.isNotEmpty) {
      switch (alignment) {
        case "center":
          return CrossAxisAlignment.center;
        case "start":
          return CrossAxisAlignment.start;
        case "end":
          return CrossAxisAlignment.end;
        case "stretch":
          return CrossAxisAlignment.stretch;
      }
    }
    return null;
  }

  static TextStyle? getTextStyle(String? style){
    if(style != null && style.isNotEmpty){
      switch(style){
        case "header1":
          return TextStyles.header1;
        case "header1_highlight":
          return TextStyles.header1;
        case "header2":
          return TextStyles.header1;
        case "header2White":
          return TextStyles.header2White;
        case "header1White":
          return TextStyles.header1White;
      }
    }
    return null;
  }

  static Future<Map<String, dynamic>> loadJson(path) async {
    final String data = await rootBundle.loadString(path);
    final Map<String, dynamic> json = jsonDecode(data);
    return json;
  }
}
