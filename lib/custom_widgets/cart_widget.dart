import 'package:diet_planner/configuration/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartWidget extends StatelessWidget {
  const CartWidget(
      {super.key,
      required this.name,
      required this.price,
      required this.imagePath});
  final String name;
  final String imagePath;
  final int price;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390,
      height: 129,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          Row(
            children: [
              const SizedBox(
                width: 24,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Text(
                    "$price AED",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.primaryColor),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Container(
            height: 1,
            color: AppTheme.secondaryColor,
          )
        ],
      ),
    );
  }
}
