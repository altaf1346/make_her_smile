import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_profile/core/constants.dart';
import 'package:my_profile/core/theme.dart';
import 'package:my_profile/core/widgets/rounded_button.dart';
import 'package:my_profile/core/widgets/tag_chip.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _nameController = TextEditingController();
  DateTime? _selectedDate;
  final List<String> _selectedTags = [];
  String _selectedDistance = 'Long-Distance';
  String _selectedBudget = 'No';
  String _selectedComfort = 'High';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
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
                                  ? 'dd-mm-yyyy'
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
                    const SizedBox(height: 16),
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

                    // Distance Section
                    _buildSectionTitle('Distance'),
                    Row(
                      children: [
                        _buildSelectableChip('Long-Distance', _selectedDistance, (val) => setState(() => _selectedDistance = val)),
                        const SizedBox(width: 12),
                        _buildSelectableChip('Nearby', _selectedDistance, (val) => setState(() => _selectedDistance = val)),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Budget Mode Section
                    _buildSectionTitle('Budget Mode'),
                    Row(
                      children: [
                        _buildSelectableChip('No', _selectedBudget, (val) => setState(() => _selectedBudget = val)),
                        const SizedBox(width: 12),
                        _buildSelectableChip('Low', _selectedBudget, (val) => setState(() => _selectedBudget = val)),
                        const SizedBox(width: 12),
                        _buildSelectableChip('High', _selectedBudget, (val) => setState(() => _selectedBudget = val)),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Emotional Comfort Section
                    _buildSectionTitle('Emotional Comfort'),
                    Row(
                      children: [
                        _buildSelectableChip('Low', _selectedComfort, (val) => setState(() => _selectedComfort = val)),
                        const SizedBox(width: 12),
                        _buildSelectableChip('High', _selectedComfort, (val) => setState(() => _selectedComfort = val)),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RoundedButton(
                text: 'Save',
                onPressed: () {
                  // Save logic here
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: AppTheme.headingMedium.copyWith(fontSize: 16),
      ),
    );
  }

  Widget _buildSelectableChip(String label, String groupValue, Function(String) onSelect) {
    final isSelected = label == groupValue;
    return GestureDetector(
      onTap: () => onSelect(label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppTheme.primaryColor : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: AppTheme.bodyMedium.copyWith(
            fontWeight: FontWeight.w500,
            color: isSelected ? AppTheme.primaryColor : AppTheme.textPrimary,
          ),
        ),
      ),
    );
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
}
