import 'package:dartz/dartz.dart';
import 'package:novis_machine_test/core/model/failure_exception.dart';
import 'package:novis_machine_test/ui/register_screen/data/datasource/register_datasource.dart';
import 'package:novis_machine_test/ui/register_screen/domain/model/branch_list_res_model.dart';
import 'package:novis_machine_test/ui/register_screen/domain/model/register_req_model.dart';
import 'package:novis_machine_test/ui/register_screen/domain/model/register_res_model.dart';
import 'package:novis_machine_test/ui/register_screen/domain/model/treatment_list_res_model.dart';
import 'package:novis_machine_test/ui/register_screen/domain/repo/register_screen_repo.dart';

class RegisterRepoImpl implements RegisterRepo{
  final RegisterDatasource datasource;
  RegisterRepoImpl(this.datasource);

  @override
  Future<Either<FailureException, BranchListResModel>> getBranchRepo() {
    return datasource.getBranchDatasource();
  }

  @override
  Future<Either<FailureException, TreatmentListResModel>> getTreatmentRepo() {
    return datasource.getTreatmentDatasource();
  }

  @override
  Future<Either<FailureException, RegisterResModel>> submitRegisterRepo(RegisterReqModel request) {
    return datasource.submitRegisterDatasource(request);
  }
}