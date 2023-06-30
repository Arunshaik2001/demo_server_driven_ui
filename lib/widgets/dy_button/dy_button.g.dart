// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_button.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicButton _$DynamicButtonFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );
  return DynamicButton(
    key: json['key'] as String?,
    child: DynamicWidget.fromJson(json['child'] as Map<String, dynamic>),
    action: json['event'] == null
        ? null
        : ActionDTO.fromJson(json['event'] as Map<String, dynamic>),
  );
}
