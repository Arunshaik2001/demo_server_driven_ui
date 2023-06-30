// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dy_screen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicScreen _$DynamicScreenFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );
  return DynamicScreen(
    key: json['key'] as String?,
    child: json['child'] == null
        ? null
        : DynamicWidget.fromJson(json['child'] as Map<String, dynamic>),
    pageTitle: json['pageTitle'] as String,
  );
}
