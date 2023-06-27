// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamic_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicText _$DynamicTextFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );
  return DynamicText(
    key: json['key'] as String?,
    text: json['text'] as String?,
  )..style = WidgetUtil.getTextStyle(json['style'] as String?);
}
