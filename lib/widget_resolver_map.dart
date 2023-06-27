

import 'package:demo_server_driven_ui/constants/constants.dart';

abstract class WidgetResolverMap{
  static Map<String, WidgetResolver> _widgetResolvers = Map<String, WidgetResolver>();

  static void addWidgetResolver(String type, WidgetResolver widgetResolver){
    _widgetResolvers[type] =  widgetResolver;
  }

  static void removeWidgetResolver(String type){
    _widgetResolvers.remove(type);
  }

  static WidgetResolver? getResolverForType(String type){
    return _widgetResolvers[type];
  }
}