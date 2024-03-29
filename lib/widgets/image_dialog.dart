import 'package:flutter/material.dart';

class ImageDialogLx extends StatelessWidget {
  const ImageDialogLx({super.key, required url}) : _url = url;
  final String _url;

  @override
  Widget build(BuildContext context) {
    return Dialog(child: Image.network(_url, fit: BoxFit.cover));
  }
}
