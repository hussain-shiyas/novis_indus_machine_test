import 'package:novis_machine_test/core/endpoints/endpoints.dart';
import 'package:novis_machine_test/core/model/failure_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:novis_machine_test/core/services/network_service/network_services.dart';
import 'package:novis_machine_test/ui/register_screen/domain/model/branch_list_res_model.dart';
import 'package:novis_machine_test/ui/register_screen/domain/model/register_req_model.dart';
import 'package:novis_machine_test/ui/register_screen/domain/model/register_res_model.dart';
import 'package:novis_machine_test/ui/register_screen/domain/model/treatment_list_res_model.dart';

abstract class RegisterDatasource {
  Future<Either<FailureException, TreatmentListResModel>>
      getTreatmentDatasource();

  Future<Either<FailureException, BranchListResModel>> getBranchDatasource();
  Future<Either<FailureException,RegisterResModel>> submitRegisterDatasource(RegisterReqModel request);
}

class RegisterDatasourceImpl implements RegisterDatasource {
  final NetworkService networkService;

  RegisterDatasourceImpl({required this.networkService});

  @override
  Future<Either<FailureException, BranchListResModel>>
      getBranchDatasource() async {
    try {
      final data = await networkService.get(EndPoints.getBranchList);
      return Right(BranchListResModel.fromJson(data));
    } catch (e) {
      return Left(FailureException(
        'Failed to fetch data from the server',
        '500',
      ));
    }
  }

  @override
  Future<Either<FailureException, TreatmentListResModel>>
      getTreatmentDatasource() async {
    try {
      final data = await networkService.get(EndPoints.getTreatmentList);
      return Right(TreatmentListResModel.fromJson(data));
    } catch (e) {
      return Left(FailureException(
        'Failed to fetch data from the server',
        '500',
      ));
    }
  }

  @override
  Future<Either<FailureException, RegisterResModel>> submitRegisterDatasource(RegisterReqModel request) async{
    try {
      final data = await networkService.post(EndPoints.getBranchList,body: request.toJson());
      return Right(RegisterResModel());
    } catch (e) {
      return Left(FailureException(
        'Failed to fetch data from the server',
        '500',
      ));
    }
  }
}
