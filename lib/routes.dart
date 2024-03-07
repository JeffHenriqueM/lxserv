import 'package:flutter/material.dart';
import 'package:lxserv/view/create_servidor_view.dart';
import 'package:lxserv/view/servidores_table.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const CreateServidor());
      case '/servidores':
        return MaterialPageRoute(
            builder: (_) => const ServidoresDataTableFlutter(),
            settings: settings);
      default:
        return MaterialPageRoute(builder: (_) => const CreateServidor());
    }
  }
}
