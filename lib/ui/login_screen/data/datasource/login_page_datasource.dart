import 'package:novis_machine_test/core/endpoints/endpoints.dart';
import 'package:novis_machine_test/core/model/failure_exception.dart';
import 'package:novis_machine_test/core/services/network_service/network_services.dart';
import 'package:novis_machine_test/ui/login_screen/domain/model/login_page_res_model.dart';
import 'package:dartz/dartz.dart';

abstract class LoginPageDatasource {
  Future<Either<FailureException, LoginResModel>> getLoginPageDatasource(
      String username, String password);
}

class LoginPageDatasourceImpl implements LoginPageDatasource {
  final NetworkService networkService;

  LoginPageDatasourceImpl({required this.networkService});

  @override
  Future<Either<FailureException, LoginResModel>>
      getLoginPageDatasource(String username, String password) async {
    try {
      var body={
        "username":username,
        "password":password
      };
      final data = await networkService.post(EndPoints.login,body: body);
      return Right(LoginResModel.fromJson(data));
    } catch (e) {
      return Left(FailureException(
        'Failed to fetch data from the server',
        '500',
      ));
    }
  }
}
