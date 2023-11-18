import 'package:flutter/material.dart';

class FormDescriptionWidget extends StatelessWidget {
  const FormDescriptionWidget({
    super.key,
    required this.description,
  });

  final TextEditingController description;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: description,
      decoration: const InputDecoration(hintText: 'Descrição'),
    );
  }
}
