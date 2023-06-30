import 'package:demo_server_driven_ui/repos/dynamic_widget_handler_repo.dart';
import 'package:demo_server_driven_ui/widgets/dy_button/dy_button.dart';
import 'package:demo_server_driven_ui/widgets/dy_column/dynamic_column.dart';
import 'package:demo_server_driven_ui/widgets/dy_container/dynamic_container.dart';
import 'package:demo_server_driven_ui/widgets/dy_row/dynamic_row.dart';
import 'package:demo_server_driven_ui/widgets/dy_screen/dy_screen.dart';
import 'package:demo_server_driven_ui/widgets/dy_text/dynamic_text.dart';
import 'package:demo_server_driven_ui/widgets/dy_text_field/dy_text_field.dart';

class DynamicWidgetHandlers {
  static init() {
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        "dy_screen", (json) => DynamicScreen.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        "dy_container", (json) => DynamicContainer.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        "dy_text", (json) => DynamicText.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        "dy_column", (json) => DynamicColumn.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        "dy_row", (json) => DynamicRow.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        "dy_button", (json) => DynamicButton.fromJson(json));
    DynamicWidgetHandlerRepo.addDynamicWidgetHandler(
        "dy_text_field", (json) => DynamicTextField.fromJson(json));
  }
}
