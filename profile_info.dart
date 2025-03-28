import 'package:flutter/material.dart';
import 'package:flutter_projects_1/widgets/profile_related_widgets/info_related_widgets/profile_info_row.dart';
import 'package:flutter_projects_1/widgets/profile_related_widgets/info_related_widgets/profile_info_row_with_edit.dart';

class ProfileInfo extends StatelessWidget {
  final String name;
  final String email;
  final String weight;
  final String height;
  final bool isEditing; // Added
  final VoidCallback onSavePressed; // Added
  final VoidCallback onEditPressed;

  const ProfileInfo({
    super.key,
    required this.name,
    required this.email,
    required this.weight,
    required this.height,
    required this.onEditPressed,
    this.isEditing = false, // Default false (not in edit mode)
    required this.onSavePressed, // Required save action
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileInfoRowWithEdit(label: 'Name:', value: name, onEditPressed: onEditPressed),
        ProfileInfoRow(label: 'Email:', value: email),
        ProfileInfoRow(label: 'Weight:', value: weight),
        ProfileInfoRow(label: 'Height:', value: height),
        if (isEditing) // Show Save Button Only in Editing Mode
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ElevatedButton(
              onPressed: onSavePressed,
              child: const Text("Save"),
            ),
          ),
      ],
    );
  }
}
