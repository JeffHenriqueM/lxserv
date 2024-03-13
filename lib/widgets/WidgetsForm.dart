import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class WidgetRowText extends StatelessWidget {
  const WidgetRowText({
    super.key,
    required this.controller,
    required this.title,
  });

  final TextEditingController controller;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        SizedBox(
          width: 200,
          child: TextFormField(
            cursorColor: Colors.green,
            textAlign: TextAlign.center,
            controller: controller,
          ),
        ),
      ],
    );
  }
}

class WidgetRowCnpj extends StatelessWidget {
  WidgetRowCnpj({
    super.key,
    required this.controller,
    required this.title,
  });

  final TextEditingController controller;
  final String title;
  final maskCNPJ = MaskTextInputFormatter(
      mask: "##.###.###/####-##", filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        SizedBox(
          width: 200,
          child: TextFormField(
            inputFormatters: [maskCNPJ],
            cursorColor: Colors.green,
            textAlign: TextAlign.center,
            controller: controller,
          ),
        ),
      ],
    );
  }
}

class WidgetRowNumber extends StatelessWidget {
  const WidgetRowNumber({
    super.key,
    required this.controller,
    required this.title,
  });

  final TextEditingController controller;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        SizedBox(
          width: 200,
          child: TextField(
            keyboardType: TextInputType.number,
            cursorColor: Colors.green,
            textAlign: TextAlign.center,
            controller: controller,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ], // Only numbers can be entered
          ),
        ),
      ],
    );
  }
}
