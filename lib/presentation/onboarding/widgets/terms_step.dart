import 'package:flutter/material.dart';

class TermsStep extends StatelessWidget {
  final bool accepted;
  final Function(bool?) onChanged;

  const TermsStep({
    super.key,
    required this.accepted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Terms & Conditions",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3)],
          ),
          child: CheckboxListTile(
            value: accepted,
            onChanged: onChanged,
            title: const Text("I accept the Terms & Conditions"),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            activeColor: Colors.indigo,
          ),
        ),
      ],
    );
  }
}
