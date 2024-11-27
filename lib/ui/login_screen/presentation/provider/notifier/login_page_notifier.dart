import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novis_machine_test/core/local_storage/hive.dart';
import 'package:novis_machine_test/ui/login_screen/domain/repository/login_page_repo.dart';
import 'package:novis_machine_test/ui/login_screen/presentation/state/login_page_state.dart';

class LoginPageNotifier extends StateNotifier<LoginPageState> with StorageServiceMixin{
  final LoginPageRepo repo;

  LoginPageNotifier(this.repo) : super(const Initial());

  Future<void> getLoginResData(String username, String password) async {
    state = const LoginPageState.loading();
    try {
        var data = await repo.getLoginPageRepo("test_user","12345678");
        // var data = await repo.getLoginPageRepo(username,password);
        state = data.fold(((failure) {
          return LoginPageState.failure(failure.message);
        }), (success) {
          return LoginPageSuccess(success);
        });
      
  
    } catch (e) {
      state = const LoginPageState.failure('failure.message');
    }
  }
}