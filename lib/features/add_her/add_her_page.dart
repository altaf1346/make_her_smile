import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_profile/core/constants.dart';
import 'package:my_profile/core/theme.dart';
import 'package:my_profile/core/widgets/rounded_button.dart';
import 'package:my_profile/core/widgets/tag_chip.dart';
import 'package:my_profile/features/home/home_page.dart';

class AddHerPage extends StatefulWidget {
  const AddHerPage({super.key});

  @override
  State<AddHerPage> createState() => _AddHerPageState();
}

class _AddHerPageState extends State<AddHerPage> {
  final TextEditingController _nameController = TextEditingController();
  DateTime? _selectedDate;
  final List<String> _selectedTags = [];

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _toggleTag(String tag) {
    setState(() {
      if (_selectedTags.contains(tag)) {
        _selectedTags.remove(tag);
      } else {
        _selectedTags.add(tag);
      }
    });
  }

  IconData? _getIconForTag(String tag) {
    switch (tag) {
      case '#Foodie': return Icons.restaurant;
      case '#Romantic': return Icons.favorite_border;
      case '#Introvert': return Icons.person_outline;
      case '#Extrovert': return Icons.group_outlined;
      case '#Adventurous': return Icons.landscape;
      case '#Creative': return Icons.palette_outlined;
      case '#Techie': return Icons.code;
      case '#Fitness': return Icons.fitness_center;
      case '#Traveler': return Icons.flight;
      case '#Bookworm': return Icons.book_outlined;
      default: return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Her'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name Input
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        hintText: 'Her Name',
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Date Picker
                    GestureDetector(
                      onTap: _pickDate,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _selectedDate == null
                                  ? 'Her Birthday'
                                  : DateFormat('dd-MM-yyyy').format(_selectedDate!),
                              style: AppTheme.bodyMedium.copyWith(
                                color: _selectedDate == null ? AppTheme.textMuted : AppTheme.textPrimary,
                              ),
                            ),
                            const Icon(Icons.calendar_today_outlined, color: AppTheme.textMuted),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Tags Section
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: AppConstants.defaultTags.map((tag) {
                        final isSelected = _selectedTags.contains(tag);
                        return TagChip(
                          label: tag,
                          icon: _getIconForTag(tag),
                          isSelected: isSelected,
                          onTap: () => _toggleTag(tag),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 24),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Search or add custom tags',
                        style: AppTheme.bodyMedium.copyWith(color: AppTheme.primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RoundedButton(
                text: 'Continue',
                onPressed: () {
                  // Save logic here
                  // For now, navigate to Home
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
