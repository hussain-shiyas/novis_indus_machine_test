import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novis_machine_test/core/services/network_service/network_services.dart';
import 'package:novis_machine_test/ui/login_screen/data/datasource/login_page_datasource.dart';
import 'package:novis_machine_test/ui/login_screen/data/repository_impl/login_page_repo_impl.dart';
import 'package:novis_machine_test/ui/login_screen/domain/repository/login_page_repo.dart';

final networkServiceProvider = Provider((ref) => NetworkService());

final datasourceProvider=Provider<LoginPageDatasource>((ref){
  final networkService = ref.watch(networkServiceProvider);
  return LoginPageDatasourceImpl(networkService: networkService);
});
final repositoryProvider=Provider<LoginPageRepo>((ref){
  final dataSource=ref.watch(datasourceProvider);
  return LoginPageRepoImpl(dataSource);
});