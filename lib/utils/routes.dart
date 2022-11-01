import 'package:evince_test/screens.dart/details_page.dart';
import 'package:evince_test/screens.dart/error_screen.dart';
import 'package:evince_test/screens.dart/main_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MainMobilePage.route:
      return MaterialPageRoute(
        builder: (context) => const MainMobilePage(),
      );
    case DetailPage.route:
      final arguments = settings.arguments as Map<String, dynamic>;
      final audio = arguments['audio'];
      final deviceHeight = arguments['deviceHeight'];
      final deviceWidth = arguments['deviceWidth'];
      final image = arguments['image'];
      return MaterialPageRoute(
        builder: (context) => DetailPage(
            audio: audio,
            deviceHeight: deviceHeight,
            deviceWidth: deviceWidth,
            image: image),
      );
    default:
      return MaterialPageRoute(
        builder: (context) =>
            const ErrorScreen(message: 'This page doesn\'t exist'),
      );
  }
}
