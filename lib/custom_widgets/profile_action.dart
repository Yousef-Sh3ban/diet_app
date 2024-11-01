import 'package:diet_planner/configuration/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileAction extends StatelessWidget {
  const ProfileAction({super.key, required this.iconPath, required this.name});
  final String iconPath;
  final String name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 53,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              const SizedBox(height: 15,),
          Row(
            children: [
              const SizedBox(width: 8,),
              SvgPicture.asset(iconPath),
              const SizedBox(width: 16,),
              Text(
                name,
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const Expanded(child: SizedBox()),
              SvgPicture.asset("assets/icons/arrow-up.svg"),
            ],
          ),
              const SizedBox(height: 13,),
          Container(height: 1,color:AppTheme.secondaryColor ,)
        ],
      ),
    );
  }
}
