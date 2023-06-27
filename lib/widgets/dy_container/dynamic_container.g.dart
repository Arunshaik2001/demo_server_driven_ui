// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamic_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicContainer _$DynamicContainerFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key'],
  );
  return DynamicContainer(
    key: json['key'] as String?,
    backgroundColor: json['backgroundColor'] as String?,
    padding: (json['padding'] as num?)?.toDouble(),
    height: (json['height'] as num?)?.toDouble(),
    width: (json['width'] as num?)?.toDouble(),
    child: json['child'] == null
        ? null
        : DynamicWidget.fromJson(json['child'] as Map<String, dynamic>),
    alignment: WidgetUtil.getPositionalAlignment(json['alignment'] as String?),
  );
}
