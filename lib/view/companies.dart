import 'package:flutter/material.dart';

class Companies extends StatefulWidget {
  const Companies({super.key});

  @override
  State<Companies> createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies> {
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
