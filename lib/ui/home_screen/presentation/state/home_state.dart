import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:novis_machine_test/ui/home_screen/domain/model/patient_list_res_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState{
  const factory HomeState.initial()= Initial;
  const factory HomeState.loading()= Loading;
  const factory HomeState.success(PatientListResModel homePageSuccess)= HomePageSuccess;
  const factory HomeState.failure(String message)= HomePageFailure;
}