import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:novis_machine_test/ui/login_screen/domain/model/login_page_res_model.dart';

part 'login_page_state.freezed.dart';

@freezed
class LoginPageState with _$LoginPageState{
const factory LoginPageState.initial()= Initial;
const factory LoginPageState.loading()= Loading;
const factory LoginPageState.success(LoginResModel loginPageSuccess)= LoginPageSuccess;
const factory LoginPageState.failure(String message)= LoginPageFailure;
}