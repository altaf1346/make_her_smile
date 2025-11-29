import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_profile/core/theme.dart';
import 'package:my_profile/core/widgets/rounded_button.dart';
import 'package:my_profile/features/auth/auth_service.dart';
import 'package:my_profile/features/auth/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _relationshipDuration;
  bool _isLoading = false;

  final List<String> _durationOptions = [
    'Less than 1 year',
    '1 - 3 years',
    '3 - 5 years',
    '5 - 10 years',
    'More than 10 years',
  ];

  Future<void> _signup() async {
    setState(() => _isLoading = true);
    try {
      // TODO: Save name and relationship duration
      await context.read<AuthService>().signUp(
            _emailController.text.trim(),
            _passwordController.text.trim(),
          );
      if (mounted) {
        Navigator.popUntil(context, (route) => route.isFirst);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'About you',
                  style: AppTheme.headingMedium.copyWith(fontSize: 18),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Create an account',
                style: AppTheme.headingLarge,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Your name',
                  filled: true,
                  fillColor: AppTheme.primaryContainer,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _relationshipDuration,
                items: _durationOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _relationshipDuration = newValue;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Relationship duration with her',
                  filled: true,
                  fillColor: AppTheme.primaryContainer,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide.none,
                  ),
                ),
                icon: const Icon(Icons.keyboard_arrow_down),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: AppTheme.primaryContainer,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: AppTheme.primaryContainer,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 40),
              RoundedButton(
                text: 'Sign Up',
                onPressed: _signup,
                isLoading: _isLoading,
              ),
              const SizedBox(height: 16),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  child: Text(
                    'Already have an account? Login',
                    style: AppTheme.bodyMedium.copyWith(
                      color: AppTheme.textMuted,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
