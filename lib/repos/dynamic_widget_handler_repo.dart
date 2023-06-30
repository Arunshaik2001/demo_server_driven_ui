
import 'package:demo_server_driven_ui/constants/constants.dart';

class DynamicWidgetHandlerRepo{
  static final Map<String, DynamicWidgetHandler> _dynamicWidgetHandler = <String, DynamicWidgetHandler>{};

  static void addDynamicWidgetHandler(String type, DynamicWidgetHandler widgetResolver){
    _dynamicWidgetHandler[type] =  widgetResolver;
  }

  static void removeDynamicWidgetHandler(String type){
    _dynamicWidgetHandler.remove(type);
  }

  static DynamicWidgetHandler? getDynamicWidgetHandlerForType(String type){
    return _dynamicWidgetHandler[type];
  }
}