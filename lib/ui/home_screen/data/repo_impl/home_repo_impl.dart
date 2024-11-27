import 'package:dartz/dartz.dart';
import 'package:novis_machine_test/core/model/failure_exception.dart';
import 'package:novis_machine_test/ui/home_screen/data/datasource/home_datasource.dart';
import 'package:novis_machine_test/ui/home_screen/domain/model/patient_list_res_model.dart';
import 'package:novis_machine_test/ui/home_screen/domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeDatasource datasource;

  HomeRepoImpl(this.datasource);

  @override
  Future<Either<FailureException, PatientListResModel>> getHomeRepo() {
    return datasource.getHomeRepo();
  }
}
