import 'package:dartz/dartz.dart';
import 'package:novis_machine_test/core/endpoints/endpoints.dart';
import 'package:novis_machine_test/core/model/failure_exception.dart';
import 'package:novis_machine_test/core/services/network_service/network_services.dart';
import 'package:novis_machine_test/ui/home_screen/domain/model/patient_list_res_model.dart';

abstract class HomeDatasource{
  Future<Either<FailureException,PatientListResModel>> getHomeRepo();
}

class HomeDatasourceImpl implements HomeDatasource{
  final NetworkService networkService;

  HomeDatasourceImpl({required this.networkService});
  @override
  Future<Either<FailureException, PatientListResModel>> getHomeRepo() async{
    try {
      final data = await networkService.get(EndPoints.getPatientList);
      return Right(PatientListResModel.fromJson(data));
    } catch (e) {
      return Left(FailureException(
        'Failed to fetch data from the server',
        '500',
      ));
    }
  }

}