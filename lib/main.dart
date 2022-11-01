import 'package:evince_test/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens.dart/main_screen.dart';

//Before you start please refer to the ReadMe!
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: const MainMobilePage(),
        onGenerateRoute: (settings) => generateRoute(settings),
      ),
    );
  }
}
