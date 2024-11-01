import 'package:diet_planner/custom_widgets/meal_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          SvgPicture.asset("assets/icons/search_normal_black.svg",),
          const SizedBox(width: 24)
        ],
        title: Text(
          "  Plans",
          style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: ListView.builder(
            itemBuilder: (context, int index) {
              return index % 4 == 0 ? meals[0] : meals[1];
            },
            itemCount: 4),
      ),
    );
  }
}
