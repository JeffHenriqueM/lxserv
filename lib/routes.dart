import 'package:flutter/material.dart';
import 'package:lxserv/view/companies.dart';
import 'package:lxserv/view/companies_table.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Companies());
      case '/companiesTable':
        return MaterialPageRoute(
            builder: (_) => const DataTableFlutter(), settings: settings);
      default:
        return MaterialPageRoute(builder: (_) => const Companies());
    }
  }
}
