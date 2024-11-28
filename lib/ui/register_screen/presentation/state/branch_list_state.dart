import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:novis_machine_test/ui/register_screen/domain/model/branch_list_res_model.dart';

part 'branch_list_state.freezed.dart';

@freezed
class BranchListState with _$BranchListState{
  const factory BranchListState.initial()= Initial;
  const factory BranchListState.loading()= Loading;
  const factory BranchListState.success(BranchListResModel branchListSuccess)= BranchListSuccess;
  const factory BranchListState.failure(String message)= BranchListFailure;
}