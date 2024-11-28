import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:novis_machine_test/ui/register_screen/domain/model/register_res_model.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState{
  const factory RegisterState.initial()= Initial;
  const factory RegisterState.loading()= Loading;
  const factory RegisterState.success(RegisterResModel registerSuccess)= RegisterSuccess;
  const factory RegisterState.failure(String message)= RegisterFailure;
}