import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novis_machine_test/ui/home_screen/domain/repo/home_repo.dart';
import 'package:novis_machine_test/ui/home_screen/presentation/state/home_state.dart';

class HomeNotifier extends StateNotifier<HomeState>{
  final HomeRepo repo;
  HomeNotifier(this.repo) : super(const Initial());

  Future<void> getHomeResData() async{
    state = const HomeState.initial();
    try {
      var data = await repo.getHomeRepo();
      state = data.fold(((failure) {
        return HomeState.failure(failure.message);
      }), (success) {
        return HomeState.success(success);
      });
    } catch (e) {
      state = const HomeState.failure('failure.message');
    }
  }
}