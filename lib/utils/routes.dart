import 'package:evince_test/screens.dart/error_screen.dart';
import 'package:evince_test/screens.dart/main_screen.dart';
import 'package:flutter/material.dart';

// static const String routeName = '/mobile-chat-screen';
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MainMobilePage.route:
      return MaterialPageRoute(
        builder: (context) => const MainMobilePage(),
      );
    // case DetailPage.route:
    //   final arguments = settings.arguments as Map<String, dynamic>;
    //   final audio = arguments['name'];
    //   return MaterialPageRoute(
    //     builder: (context) => DetailPage(audio: ,deviceHeight: ,deviceWidth: ,image: ,
    //     ),
    //   );
    default:
      return MaterialPageRoute(
        builder: (context) =>
            const ErrorScreen(message: 'This page doesn\'t exist'),
      );
  }
}
