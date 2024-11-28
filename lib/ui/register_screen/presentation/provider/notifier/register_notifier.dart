 import 'package:flutter/cupertino.dart';
import 'package:novis_machine_test/ui/register_screen/domain/model/register_req_model.dart';
import 'package:novis_machine_test/ui/register_screen/domain/repo/register_screen_repo.dart';
import 'package:novis_machine_test/ui/register_screen/presentation/state/branch_list_state.dart';
import 'package:novis_machine_test/ui/register_screen/presentation/state/register_state.dart';
import 'package:novis_machine_test/ui/register_screen/presentation/state/treatment_list_state.dart';

class RegisterNotifier extends ChangeNotifier{
  final RegisterRepo repo;
  RegisterNotifier(this.repo);
  BranchListState branchListState=const BranchListState.initial();
  TreatmentListState treatmentListState=const TreatmentListState.initial();
  RegisterState registerState=const RegisterState.initial();

  Future<void> getBranchList()async{
    branchListState=const BranchListState.loading();
    notifyListeners();
    try {
      var data = await repo.getBranchRepo();
      branchListState = data.fold(((failure) {
        return BranchListState.failure(failure.message);
      }), (success) {
        return BranchListState.success(success);
      });
      notifyListeners();
    } catch (e) {
       branchListState=const BranchListFailure("failure");
       notifyListeners();
    }
  }
  Future<void> getTreatmentList()async{
    treatmentListState=const TreatmentListState.loading();
    notifyListeners();
    try {
      var data = await repo.getTreatmentRepo();
      treatmentListState = data.fold(((failure) {
        return TreatmentListState.failure(failure.message);
      }), (success) {
        return TreatmentListState.success(success);
      });
      notifyListeners();
    } catch (e) {
      treatmentListState=const TreatmentListState.failure("failure");
      notifyListeners();
    }
  }
  Future<void> submitRegisterForm(RegisterReqModel request)async{
    registerState=const RegisterState.loading();
    notifyListeners();
    try {
      var data = await repo.submitRegisterRepo(request);
      registerState = data.fold(((failure) {
        return RegisterState.failure(failure.message);
      }), (success) {
        return RegisterState.success(success);
      });
      notifyListeners();
    } catch (e) {
      registerState=const RegisterState.failure("failure");
      notifyListeners();
    }
  }
}