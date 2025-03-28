import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_projects_1/color_extension.dart';
import 'package:flutter_projects_1/widgets/profile_related_widgets/profile_controller.dart';
import 'package:flutter_projects_1/widgets/profile_related_widgets/profile_avatar.dart';
import 'package:flutter_projects_1/widgets/profile_related_widgets/profile_toggle_buttons.dart';
import 'package:flutter_projects_1/widgets/table_widgets/workout_exercise_table.dart';
import 'package:flutter_projects_1/widgets/profile_related_widgets/edit_related_widgets/update_profile_button.dart';
import 'package:flutter_projects_1/widgets/profile_related_widgets/edit_related_widgets/edit_text_field.dart';
import 'package:flutter_projects_1/widgets/health_related_widgets/custom_slider.dart';
import 'package:flutter_projects_1/widgets/profile_related_widgets/edit_related_widgets/height_selector.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileController(),
      child: Scaffold(
        backgroundColor: MyColors.white,
        appBar: AppBar(
          title: const Text("Edit Profile"),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: MyColors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Consumer<ProfileController>(
          builder: (context, controller, child) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const ProfileAvatar(),
                    const SizedBox(height: 20),

                    ProfileToggleButtons(
                      isPrivate: controller.isPrivate,
                      onInfoSelected: () => controller.togglePrivacy(false),
                      onPrivacySelected: () => controller.togglePrivacy(true),
                    ),
                    const SizedBox(height: 40),

                    const EditTextField(hintText: "Enter Name"),
                    const SizedBox(height: 10),

                    const EditTextField(hintText: "Enter Email"),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Weight",
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      "${controller.weight.toInt()} Kg",
                                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              CustomSlider(
                                value: controller.weight,
                                min: 40,
                                max: 150,
                                onChanged: (value) => controller.updateProfileInfo(weight: value),
                                color: MyColors.PrimaryBlue,
                                tooltipColor: MyColors.PrimaryBlue,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: HeightSelector(
                            height: controller.height.toInt(),
                            onIncrease: () {
                              if (controller.height < 250) {
                                controller.updateProfileInfo(height: controller.height + 1);
                              }
                            },
                            onDecrease: () {
                              if (controller.height > 50) {
                                controller.updateProfileInfo(height: controller.height - 1);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: WorkoutTable(),
                    ),

                    const SizedBox(height: 20),

                    UpdateButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
