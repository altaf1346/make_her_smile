import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_profile/core/theme.dart';
import 'package:my_profile/features/auth/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthService>().currentUser;
    final userName = user?.displayName ?? 'User';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Today\'s Grit'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, $userName, here\'s something to make her smile today 💌',
              style: AppTheme.headingMedium,
            ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Placeholder for illustration
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppTheme.primaryContainer,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
                    child: Image.asset(
                      'assets/image/smile.jpg',
                      // Add the fit property here
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Surprise her with a thoughtful gesture',
                          style: AppTheme.headingMedium.copyWith(fontSize: 18),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Showing appreciation for your partner\'s efforts, no matter how small, can significantly strengthen your relationship. It fosters a sense of value and deepens your connection.',
                          style: AppTheme.bodyMedium.copyWith(
                            color: AppTheme.textMuted,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'This nudge is designed to help you show appreciation for your partner\'s efforts, fostering a sense of value and strengthening your bond.',
                          style: AppTheme.bodyMedium.copyWith(
                            color: AppTheme.textMuted,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
