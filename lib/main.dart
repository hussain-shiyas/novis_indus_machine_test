import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novis_machine_test/core/local_storage/hive.dart';
import 'package:novis_machine_test/ui/login_screen/presentation/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StorageServiceMixin.initHive();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:HomePage(),
    );
  }
}

