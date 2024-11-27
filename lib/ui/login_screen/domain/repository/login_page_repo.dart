import 'package:novis_machine_test/core/model/failure_exception.dart';
import 'package:novis_machine_test/ui/login_screen/domain/model/login_page_res_model.dart';
import 'package:dartz/dartz.dart';

abstract class LoginPageRepo{
  Future<Either<FailureException,LoginResModel>> getLoginPageRepo(String username, String password);
}