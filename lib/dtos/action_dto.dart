import 'package:json_annotation/json_annotation.dart';

part 'action_dto.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class ActionDTO {
  String? actionString;
  Map<String, dynamic>? extras;

  ActionDTO(this.actionString, this.extras);

  factory ActionDTO.fromJson(Map<String, dynamic> json) =>
      _$ActionDTOFromJson(json);
}
