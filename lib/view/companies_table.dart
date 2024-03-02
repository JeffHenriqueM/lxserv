import 'package:flutter/material.dart';
import 'package:lxserv/controller/companies_controller.dart';

class DataTableFlutter extends StatefulWidget {
  const DataTableFlutter({super.key});

  @override
  State<DataTableFlutter> createState() => _DataTableFlutterState();
}

class _DataTableFlutterState extends State<DataTableFlutter> {
  CompaniesController controller = CompaniesController();

  @override
  void initState() {
    super.initState();
    controller.getCompanies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
