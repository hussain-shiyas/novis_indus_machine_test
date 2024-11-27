import 'package:novis_machine_test/core/model/failure_exception.dart';
import 'package:novis_machine_test/ui/home_screen/domain/model/patient_list_res_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<FailureException,PatientListResModel>> getHomeRepo();
}