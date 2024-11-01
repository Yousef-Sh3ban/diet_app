import 'package:diet_planner/blocs/check_box_bloc.dart';
import 'package:diet_planner/configuration/app_events.dart';
import 'package:diet_planner/configuration/app_routes.dart';
import 'package:diet_planner/configuration/app_states.dart';
import 'package:diet_planner/configuration/app_theme.dart';
import 'package:diet_planner/custom_widgets/app_banner.dart';
import 'package:diet_planner/custom_widgets/cusom_text_field.dart';
import 'package:diet_planner/custom_widgets/custom_button_widget.dart';
import 'package:diet_planner/custom_widgets/signin_ways_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AppBanner(
                  logoPath: "assets/images/app_logo_white_text_white.png",
                  svgPath: "assets/icons/close_circle.svg",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create New Account",
                          style: GoogleFonts.poppins
                          (
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                        Text("Have a healthy & Tasty day ahead",
                            style:  GoogleFonts.poppins
                            (
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
                              style: GoogleFonts.poppins
                              (
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
                        const SizedBox(
                          height: 24,
                        ),
                        const CusomTextField(hint: "Full Name"),
                        const SizedBox(
                          height: 16,
                        ),
                        const CusomTextField(hint: "Email Address"),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 56,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFEDEDED)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 24),
                              Container(
                                height: 31,
                                width: 44,
                                decoration: const BoxDecoration(),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                        "assets/images/are_flag.png")),
                              ),
                              Text(
                                "  (+971)",
                                style: GoogleFonts.poppins
                                (
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const CusomTextField(
                          hint: "Password",
                          ispassword: true,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const CusomTextField(
                          hint: "Confirm Password",
                          ispassword: true,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const CusomTextField(hint: "Enter referral code (Optional)"),
                        const SizedBox(
                          height: 24,
                        ),
      
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            BlocBuilder<CheckBoxBloc, CheckboxState>(
                              builder: (context, state) {
                                return SizedBox(width: 20,height:20,
                                  child: Checkbox(
                                    side: const BorderSide(
                                        color: AppTheme.primaryColor, width: 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    value: state.isChecked,
                                    onChanged: (bool? value) {
                                      BlocProvider.of<CheckBoxBloc>(context)
                                          .add(ToggleCheckboxEvent(value!));
                                    },
                                  ),
                                );
                              },
                            ),
                            const SizedBox(width: 14,),
                            Text(
                              " I Accept the",
                              style:GoogleFonts.poppins
                              (
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            Text(
                              " terms & Conditions",
                              style: GoogleFonts.poppins
                              (
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.primaryColor),
                            ),
                          ],
                        ), 
                        const SizedBox(
                          height: 32,
                        ),
                        const CustomButtonWidget(text: "Create an account"),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already an existing user?",
                              style:GoogleFonts.poppins
                              (
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, AppRoutes.login);
                              },
                              child: Text(
                                " Login",
                                style:  GoogleFonts.poppins
                                (
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.primaryColor),
                              ),
                            ),
                          ],
                        ) 
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
