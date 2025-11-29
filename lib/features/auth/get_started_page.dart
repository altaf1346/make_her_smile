import 'package:flutter/material.dart';
import 'package:my_profile/core/theme.dart';
import 'package:my_profile/core/widgets/rounded_button.dart';
import 'package:my_profile/features/auth/signup_page.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            children: [
              const Spacer(),
              // Illustration placeholder
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  'assets/image/getstarted.jpg',
                  // Add the fit property here
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'Grit helps men take meaningful action in their relationships',
                style: AppTheme.headingLarge.copyWith(
                  fontSize: 24,
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              RoundedButton(
                text: 'Get Started',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupPage()),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
