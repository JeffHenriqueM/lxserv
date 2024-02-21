import 'package:flutter/material.dart';
import 'package:lxserv/controller/companies_controller.dart';

class Companies extends StatefulWidget {
  const Companies({super.key});

  @override
  State<Companies> createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies> {
  CompaniesController controller = CompaniesController();

  @override
  void initState() {
    super.initState();
    controller.bookSession();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [Text("OI"), Text("Eu")],
        )
      ],
    );
  }
}
