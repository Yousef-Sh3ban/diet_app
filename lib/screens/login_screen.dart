import 'package:diet_planner/configuration/app_routes.dart';
import 'package:diet_planner/configuration/app_theme.dart';
import 'package:diet_planner/custom_widgets/app_banner.dart';
import 'package:diet_planner/custom_widgets/custom_text_field.dart';
import 'package:diet_planner/custom_widgets/custom_button_widget.dart';
import 'package:diet_planner/custom_widgets/signin_ways_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBanner(
                logoPath: "assets/images/app_logo_white_text_white.png",
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back!",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      Text(
                        "Have a healthy & Tasty day ahead",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: const Color(0xFF8C8C8C),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const SigninWaysWidget(),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: const Color(0xFFEDEDED),
                            ),
                          ),
                          Text(
                            "     OR     ",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.primaryColor),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: const Color(0xFFEDEDED),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const CustomTextField(hint: "Email Address"),
                      const SizedBox(height: 16),
                      const CustomTextField(hint: "Password"),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.forgotPassword);
                            },
                            child: Text(
                              "Forgot Password?",
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.primaryColor),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.mainScreens);
                          },
                          child: const CustomButtonWidget(text: "Login")),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account? ",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutes.register);
                            },
                            child: Text(
                              "Create new one",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.primaryColor),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
