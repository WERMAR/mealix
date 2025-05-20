// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cooking_step_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CookingStep _$CookingStepFromJson(Map<String, dynamic> json) => _CookingStep(
  id: json['id'] as String,
  description: json['description'] as String,
  duration: (json['duration'] as num).toInt(),
);

Map<String, dynamic> _$CookingStepToJson(_CookingStep instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'duration': instance.duration,
    };
