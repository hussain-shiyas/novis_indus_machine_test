import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:novis_machine_test/ui/register_screen/domain/model/treatment_list_res_model.dart';

part 'treatment_list_state.freezed.dart';

@freezed
class TreatmentListState with _$TreatmentListState{
  const factory TreatmentListState.initial()= Initial;
  const factory TreatmentListState.loading()= Loading;
  const factory TreatmentListState.success(TreatmentListResModel treatmentListSuccess)= TreatmentListSuccess;
  const factory TreatmentListState.failure(String message)= TreatmentListFailure;

}