import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novis_machine_test/ui/home_screen/domain/provider/home_domain_provider.dart';
import 'package:novis_machine_test/ui/home_screen/presentation/provider/notifier/home_notifier.dart';
import 'package:novis_machine_test/ui/home_screen/presentation/state/home_state.dart';

final homeNotifierProvider=StateNotifierProvider<HomeNotifier,HomeState>((ref){
  final repo=ref.read(homeRepositoryProvider);
  return HomeNotifier(repo);
});