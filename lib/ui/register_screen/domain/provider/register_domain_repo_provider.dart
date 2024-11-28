import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novis_machine_test/core/services/network_service/network_services.dart';
import 'package:novis_machine_test/ui/register_screen/data/datasource/register_datasource.dart';
import 'package:novis_machine_test/ui/register_screen/data/repo_impl/register_repo_impl.dart';
import 'package:novis_machine_test/ui/register_screen/domain/repo/register_screen_repo.dart';

final networkProvider = Provider((ref) => NetworkService());
final registerDatasourceProvider = Provider<RegisterDatasource>((ref) {
  final networkService = ref.watch(networkProvider);
  return RegisterDatasourceImpl(networkService: networkService);
});
final registerRepoProvider = Provider<RegisterRepo>((ref) {
  final datasource = ref.watch(registerDatasourceProvider);
  return RegisterRepoImpl(datasource);
});
