import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/v4.dart';

part 'cooking_step_model.freezed.dart';
part 'cooking_step_model.g.dart';

@freezed
sealed class CookingStep with _$CookingStep {
  const factory CookingStep({
    required String id,
    required String description,
    required int duration,
  }) = _CookingStep;

  factory CookingStep.initial() =>
      CookingStep(id: const UuidV4().generate(), description: '', duration: 0);

  factory CookingStep.fromJson(Map<String, dynamic> json) =>
      _$CookingStepFromJson(json);
}
