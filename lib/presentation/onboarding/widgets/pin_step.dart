import 'package:flutter/material.dart';
import 'package:sign_up_form/core/utils/validators.dart';
import '../../shared/custom_input_field.dart';

class PinStep extends StatelessWidget {
  final TextEditingController pinController;
  final TextEditingController confirmPinController;

  const PinStep({
    super.key,
    required this.pinController,
    required this.confirmPinController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Set Your PIN",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          "Choose a 4-digit PIN to protect your account.",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 24),
        CustomInputField(
          controller: pinController,
          label: '4-digit PIN',
          keyboardType: TextInputType.number,
          obscureText: true,
          validator: Validators.validatePin,
        ),
        const SizedBox(height: 20),
        CustomInputField(
          controller: confirmPinController,
          label: 'Confirm PIN',
          keyboardType: TextInputType.number,
          obscureText: true,
          validator: (val) =>
              Validators.validateConfirmPin(val, pinController.text),
        ),
      ],
    );
  }
}
