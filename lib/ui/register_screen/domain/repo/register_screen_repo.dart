import 'package:novis_machine_test/core/model/failure_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:novis_machine_test/ui/register_screen/domain/model/branch_list_res_model.dart';
import 'package:novis_machine_test/ui/register_screen/domain/model/register_req_model.dart';
import 'package:novis_machine_test/ui/register_screen/domain/model/register_res_model.dart';
import 'package:novis_machine_test/ui/register_screen/domain/model/treatment_list_res_model.dart';

abstract class RegisterRepo{
  Future<Either<FailureException,TreatmentListResModel>> getTreatmentRepo();
  Future<Either<FailureException,BranchListResModel>> getBranchRepo();
  Future<Either<FailureException,RegisterResModel>> submitRegisterRepo(RegisterReqModel request);
}