import 'package:flutter/material.dart';

class ServissoTextFormField extends StatelessWidget {
  const ServissoTextFormField({
    required this.controller,
    required this.labelText,
    this.validator,
    super.key,
  });

  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: const Offset(0, 8),
            color: Colors.black.withOpacity(0.2),
          )
        ],
      ),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          label: Padding(
              padding: const EdgeInsets.only(bottom: 36),
              child: Text(labelText)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
