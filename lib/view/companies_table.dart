import 'package:flutter/material.dart';
import 'package:lxserv/controller/companies_controller.dart';
import 'package:lxserv/model/companies_model.dart';

class DataTableFlutter extends StatefulWidget {
  const DataTableFlutter({super.key});

  @override
  State<DataTableFlutter> createState() => _DataTableFlutterState();
}

class _DataTableFlutterState extends State<DataTableFlutter> {
  CompaniesController controller = CompaniesController();
  List<CompaniesModel> companies = List.empty();
  late CompaniesModel model;

  @override
  void initState() {
    super.initState();
    buscarDados();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }

  void buscarDados() async {
    List<CompaniesModel> list = await controller.getCompanies();
    companies = list;
    print(list);
  }
}
