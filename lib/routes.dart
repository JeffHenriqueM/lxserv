import 'package:flutter/material.dart';
import 'package:lxserv/view/create_empresa.dart';
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
      case '/empresas':
        return MaterialPageRoute(
            builder: (_) => const CreateEmpresa(), settings: settings);
      case '/createEmpresa':
        return MaterialPageRoute(
            builder: (_) => const CreateEmpresa(), settings: settings);
      default:
        return MaterialPageRoute(builder: (_) => const CreateServidor());
    }
  }
}
