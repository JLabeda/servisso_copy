import 'package:flutter/material.dart';

class ServissoTextFormField extends StatelessWidget {
  const ServissoTextFormField({
    required this.controller,
    required this.labelText,
    super.key,
  });

  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            offset: const Offset(0, 8),
            color: Colors.black.withOpacity(0.3),
          )
        ],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            label: Padding(
                padding: const EdgeInsets.only(bottom: 36),
                child: Text(labelText)),
            floatingLabelBehavior: FloatingLabelBehavior.always),
      ),
    );
  }
}
