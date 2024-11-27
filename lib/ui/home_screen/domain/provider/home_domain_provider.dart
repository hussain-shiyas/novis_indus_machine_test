import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novis_machine_test/core/services/network_service/network_services.dart';
import 'package:novis_machine_test/ui/home_screen/data/datasource/home_datasource.dart';
import 'package:novis_machine_test/ui/home_screen/data/repo_impl/home_repo_impl.dart';
import 'package:novis_machine_test/ui/home_screen/domain/repo/home_repo.dart';


final networkServiceProvider = Provider((ref)=>NetworkService());

final homeDatasourceProvider=Provider<HomeDatasource>((ref){
final networkService = ref.watch(networkServiceProvider);
  return HomeDatasourceImpl(networkService: networkService);
});

final homeRepositoryProvider=Provider<HomeRepo>((ref){
  final datasource=ref.watch(homeDatasourceProvider);
  return HomeRepoImpl(datasource);
});