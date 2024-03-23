import 'package:flutter/material.dart';

class ColumnForm extends StatelessWidget {
  const ColumnForm({super.key, required title, required widgets})
      : _title = title,
        _widgets = widgets;

  final String _title;
  final Widget _widgets;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text(_title)),
        Container(
            width: 600,
            height: 200,
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: _widgets),
      ],
    );
  }
}
