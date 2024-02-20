import 'package:flutter/material.dart';
import 'package:lxserv/view/companies.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Companies());
      /*case '/user':
        return MaterialPageRoute(
            builder: (_) => const UserHomePage(), settings: settings);*/
      default:
        return MaterialPageRoute(builder: (_) => const Companies());
    }
  }
}
