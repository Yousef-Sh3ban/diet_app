import 'package:diet_planner/configuration/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MealWidget extends StatelessWidget {
  const MealWidget({super.key, required this.imagePath, required this.name});
  final String imagePath;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: 103,
          width: double.infinity,
          child: Row(
            children: [
              SizedBox(
                width: 57,
                height: 57,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Chicken wings, Vegetables and Fru..",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF8C8C8C),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "180 AED",
                    style: GoogleFonts.poppins(
                        color: AppTheme.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              SvgPicture.asset("assets/icons/right_arrow.svg"),
            ],
          ),
        ),
        Container(
          height: 1,
          color: AppTheme.secondaryColor,
        )
      ],
    );
  }
}

List<MealWidget> meals = [
  const MealWidget(
    imagePath: "assets/images/meal_placeholder.png",
    name: "Diet Plan",
  ),
  const MealWidget(
    imagePath: "assets/images/chiken1.png",
    name: "Gym Plan",
  ),
];
