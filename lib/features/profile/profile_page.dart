import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_profile/core/theme.dart';
import 'package:my_profile/core/widgets/section_row.dart';
import 'package:my_profile/features/auth/auth_service.dart';
import 'package:my_profile/features/settings/settings_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthService>().currentUser;
    final userName = user?.displayName ?? 'Name';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => context.read<AuthService>().signOut(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Avatar
            const CircleAvatar(
              radius: 50,
              backgroundColor: AppTheme.primaryContainer,
              // Placeholder image or icon
              child: Icon(Icons.person, size: 50, color: AppTheme.primaryColor),
            ),
            const SizedBox(height: 16),
            Text(
              userName,
              style: AppTheme.headingLarge,
            ),
            Text(
              'Loading...', // Placeholder for status or bio
              style: AppTheme.bodyMedium.copyWith(color: AppTheme.primaryColor),
            ),
            const SizedBox(height: 32),

            // Relationship Section
            _buildSectionHeader('Relationship'),
            SectionRow(
              title: 'Relationship Distance',
              subtitle: 'Long-Distance',
              onTap: () {},
            ),
            SectionRow(
              title: 'Tags',
              subtitle: 'Tags will appear here.',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SettingsPage()),
                );
              },
            ),

            const SizedBox(height: 24),

            // Modes Section
            _buildSectionHeader('Modes'),
            SectionRow(
              title: 'Comfort Mode',
              subtitle: 'No data',
              onTap: () {},
            ),
            SectionRow(
              title: 'Budget Mode',
              subtitle: 'No data',
              onTap: () {},
            ),

            const SizedBox(height: 24),

            // Profile Progress Section
            _buildSectionHeader('Profile Progress'),
            SectionRow(
              title: 'Emotional Impact Streak',
              subtitle: '3 impactful weeks in a row 🎯',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: AppTheme.headingMedium.copyWith(fontSize: 18),
        ),
      ),
    );
  }
}
