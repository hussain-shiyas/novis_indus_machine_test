import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novis_machine_test/ui/register_screen/domain/provider/register_domain_repo_provider.dart';
import 'package:novis_machine_test/ui/register_screen/presentation/provider/notifier/register_notifier.dart';

final registerNotifierProvider=ChangeNotifierProvider<RegisterNotifier>((ref){
  final repo= ref.watch(registerRepoProvider);
  return RegisterNotifier(repo);
});