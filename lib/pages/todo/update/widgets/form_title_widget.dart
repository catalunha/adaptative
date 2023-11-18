import 'package:flutter/material.dart';

class FormTitleWidget extends StatelessWidget {
  const FormTitleWidget({
    super.key,
    required this.title,
  });

  final TextEditingController title;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: title,
      decoration: const InputDecoration(hintText: 'Titulo'),
    );
  }
}
