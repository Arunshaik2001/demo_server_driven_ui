import 'package:demo_server_driven_ui/widget_resolver_map.dart';
import 'package:demo_server_driven_ui/widgets/dy_column/dynamic_column.dart';
import 'package:demo_server_driven_ui/widgets/dy_container/dynamic_container.dart';
import 'package:demo_server_driven_ui/widgets/dy_row/dynamic_row.dart';
import 'package:demo_server_driven_ui/widgets/dy_text/dynamic_text.dart';

class WidgetResolvers{

  static init(){
    WidgetResolverMap.addWidgetResolver(
        "dy_container", (json) => DynamicContainer.fromJson(json));
    WidgetResolverMap.addWidgetResolver(
        "dy_text", (json) => DynamicText.fromJson(json));
    WidgetResolverMap.addWidgetResolver(
        "dy_column", (json) => DynamicColumn.fromJson(json));
    WidgetResolverMap.addWidgetResolver(
        "dy_row", (json) => DynamicRow.fromJson(json));
  }
}