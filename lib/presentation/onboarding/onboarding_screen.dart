import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_up_form/presentation/onboarding/user_summary_screen.dart';
import 'package:sign_up_form/presentation/onboarding/widgets/terms_step.dart';
import 'package:sign_up_form/presentation/onboarding/widgets/user_info_step.dart';
import '../../data/local_storage_service.dart';
import 'widgets/pin_step.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;
  bool _accepted = false;

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _pinController = TextEditingController();
  final _confirmPinController = TextEditingController();

  void _nextStep() {
    if (_formKey.currentState!.validate()) {
      if (_currentStep == 2 && !_accepted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please accept the terms")),
        );
        return;
      }
      if (_currentStep < 2) {
        setState(() => _currentStep++);
      } else {
        LocalStorageService.saveUserData(
          _nameController.text,
          _phoneController.text,
          _pinController.text,
        );
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Onboarding Complete")));

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => UserSummaryScreen(
              name: _nameController.text,
              phone: _phoneController.text,
              pin: _pinController.text,
            ),
          ),
        );
      }
    }
  }

  void _previousStep() {
    if (_currentStep > 0) setState(() => _currentStep--);
  }

  Widget _buildStep() {
    switch (_currentStep) {
      case 0:
        return UserInfoStep(
          nameController: _nameController,
          phoneController: _phoneController,
        );
      case 1:
        return PinStep(
          pinController: _pinController,
          confirmPinController: _confirmPinController,
        );
      case 2:
        return TermsStep(
          accepted: _accepted,
          onChanged: (val) => setState(() => _accepted = val ?? false),
        );
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "User Onboarding",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo[800],
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  LinearProgressIndicator(
                    value: (_currentStep + 1) / 3,
                    color: Colors.indigo,
                    backgroundColor: Colors.indigo.shade100,
                  ),
                  const SizedBox(height: 24),
                  Expanded(child: SingleChildScrollView(child: _buildStep())),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_currentStep > 0)
                        OutlinedButton.icon(
                          onPressed: _previousStep,
                          icon: const Icon(Icons.arrow_back),
                          label: const Text("Back"),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.indigo,
                            side: const BorderSide(color: Colors.indigo),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ElevatedButton.icon(
                        onPressed: _nextStep,
                        icon: Icon(
                          _currentStep == 2
                              ? Icons.check_circle
                              : Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        label: Text(
                          _currentStep == 2 ? "Finish" : "Next",
                          style: const TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 26,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
