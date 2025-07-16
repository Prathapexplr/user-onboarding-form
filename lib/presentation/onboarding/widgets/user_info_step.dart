import 'package:flutter/material.dart';
import 'package:sign_up_form/core/utils/validators.dart';
import '../../shared/custom_input_field.dart';

class UserInfoStep extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;

  const UserInfoStep({
    super.key,
    required this.nameController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Let’s Get Started",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          "Enter your name and mobile number to begin.",
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
        const SizedBox(height: 24),
        CustomInputField(
          controller: nameController,
          label: 'Full Name',
          validator: Validators.validateName,
        ),
        const SizedBox(height: 20),
        CustomInputField(
          controller: phoneController,
          label: 'Mobile Number',
          keyboardType: TextInputType.phone,
          validator: Validators.validatePhone,
        ),
      ],
    );
  }
}
