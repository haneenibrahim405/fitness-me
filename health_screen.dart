import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_projects_1/color_extension.dart';
import 'package:flutter_projects_1/widgets/health_related_widgets/nutrient_provider.dart';
import 'package:flutter_projects_1/widgets/health_related_widgets/nutrition_info_section.dart';
import 'package:flutter_projects_1/widgets/health_related_widgets/health_progress_chart.dart';
import 'package:flutter_projects_1/widgets/health_related_widgets/add_meal_button.dart';
import 'add_meal_screen.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nutrientProvider = Provider.of<NutrientProvider>(context);
    const int dailyCalorieGoal = 2000;  // Define a daily calorie goal

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
        title: const Text(
          "Health",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                children: [
                  const TextSpan(
                    text: "You have consumed\n",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: "${nutrientProvider.totalCalories.toStringAsFixed(0)} kcal",
                    style: TextStyle(color: MyColors.PrimaryBlue),
                  ),
                  const TextSpan(
                    text: " today",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            /// ✅ **Fixed: Now passing correct values**
            MultiRingCircularChart(
              fatGrams: nutrientProvider.fat,
              proteinGrams: nutrientProvider.protein,
              carbsGrams: nutrientProvider.carbs,
              totalCalories: nutrientProvider.totalCalories.toInt(),
              dailyCalorieGoal: dailyCalorieGoal,  // Pass the goal value
            ),

            const SizedBox(height: 40),


            NutritionInfoSection(
              fatGrams: nutrientProvider.fat,
              proteinGrams: nutrientProvider.protein,
              carbsGrams: nutrientProvider.carbs,
                dailyCalorieGoal: dailyCalorieGoal.toDouble(),
            ),

            const Spacer(),
            AddMealButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddMealScreen()),
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
