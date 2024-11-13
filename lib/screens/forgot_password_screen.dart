import 'package:diet_planner/custom_widgets/app_banner.dart';
import 'package:diet_planner/custom_widgets/custom_text_field.dart';
import 'package:diet_planner/custom_widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          color: const Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBanner(logoPath: "assets/images/app_logo_white_text_white.png",
                svgPath: "assets/icons/arrow_down.svg",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Forgot Password",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    Text(
                      "We’ll Send the link to the email you’ll provide below",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xFF8C8C8C),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const CustomTextField(
                      hint: "Email Address",
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const CustomButtonWidget(text: "Send the reset link")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
