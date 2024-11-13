import 'dart:developer';
import 'dart:math';

import 'package:diet_planner/blocs/check_box_bloc.dart';
import 'package:diet_planner/blocs/register_bloc.dart';
import 'package:diet_planner/configuration/app_events.dart';
import 'package:diet_planner/configuration/app_states.dart';
import 'package:diet_planner/configuration/app_theme.dart';
import 'package:diet_planner/configuration/shared_handler.dart';
import 'package:diet_planner/custom_widgets/app_banner.dart';
import 'package:diet_planner/custom_widgets/custom_text_field.dart';
import 'package:diet_planner/custom_widgets/custom_button_widget.dart';
import 'package:diet_planner/custom_widgets/custom_text_form.dart';
import 'package:diet_planner/custom_widgets/signin_ways_widget.dart';
import 'package:diet_planner/models/register_validation.dart';
import 'package:diet_planner/models/register_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emialController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  bool isChecked = false;
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
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create New Account",
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
                        const SizedBox(
                          height: 24,
                        ),
                        CustomTextForm(
                          hint: "Full Name",
                          textEditingController: _userNameController,
                          validator: nameValidation,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomTextForm(
                          keyboardType: TextInputType.emailAddress,
                          hint: "Email Address",
                          textEditingController: _emialController,
                          validator: emailValidation,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomTextForm(
                          prefix: SizedBox(
                            width: 121,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 24,
                                ),
                                SizedBox(
                                  height: 31,
                                  width: 44,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                          "assets/images/are_flag.png")),
                                ),
                                Text(
                                  "  (+971)",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                )
                              ],
                            ),
                          ),
                          hint: "",
                          keyboardType: const TextInputType.numberWithOptions(),
                          textEditingController: _phoneController,
                          validator: phoneValidation,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomTextForm(
                          ispassword: true,
                          hint: "Password",
                          textEditingController: _passwordController,
                          validator: passwordValidation,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomTextForm(
                            ispassword: true,
                            hint: "Confirm Password",
                            textEditingController:
                                _passwordConfirmationController,
                            validator: (value) => passwordConfirmaionValidation(
                                value!, _passwordController)),
                        const SizedBox(
                          height: 16,
                        ),
                        const CustomTextField(
                            hint: "Enter referral code (Optional)"),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            BlocBuilder<CheckBoxBloc, CheckboxState>(
                              builder: (context, state) {
                                return SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Checkbox(
                                    activeColor: AppTheme.primaryColor,
                                    side: const BorderSide(
                                        color: AppTheme.primaryColor, width: 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    value: state.isChecked,
                                    onChanged: (bool? value) {
                                      isChecked = value!;
                                      BlocProvider.of<CheckBoxBloc>(context)
                                          .add(ToggleCheckboxEvent(value!));
                                    },
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            Text(
                              " I Accept the",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            Text(
                              " terms & Conditions",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.primaryColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        BlocBuilder<RegisterBloc, AppState>(
                          builder: (context, state) {
                            return InkWell(
                              onTap: () {
                                if (!isChecked) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Please accept the terms and conditions"),
                                    ),
                                  );
                                }
                                if (formKey.currentState!.validate()) {
                                  if (!isChecked) return;
                                  BlocProvider.of<RegisterBloc>(context).add(
                                    RegisterEvent(
                                      RegisterModel(
                                          name: _userNameController.text,
                                          email: _emialController.text,
                                          phone: _phoneController.text,
                                          password: _passwordController.text,
                                          passwordConfirmaion:
                                              _passwordConfirmationController
                                                  .text),
                                    ),
                                  ); //loading
                                  if (state is InitState) {
                                    SharedHandler sharedHandler =
                                        SharedHandler();
                                    print("=========================");
                                    checkSavedData() async {
                                      RegisterModel temp;
                                      temp = await sharedHandler.getDate();
                                      print(temp.name);
                                      print(temp.email);
                                      print(temp.phone);
                                      print(temp.password);
                                      print(temp.passwordConfirmaion);
                                      print("=========================");
                                    }
                                    checkSavedData();
                                  }
                                  if (state is LoadingState) {
                                    const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (state is LoadedState) {
                                    SharedHandler sharedHandler =
                                        SharedHandler();

                                    sharedHandler.setDate(
                                      RegisterModel(
                                          name: _userNameController.text,
                                          email: _emialController.text,
                                          phone: _phoneController.text,
                                          password: _passwordController.text,
                                          passwordConfirmaion:
                                              _passwordConfirmationController
                                                  .text),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text("User registerd successfully"),
                                      ),
                                    );
                                  } else if (state is ErrorState) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(state.message.toString()),
                                      ),
                                    );
                                  }
                                }
                              },
                              child: const CustomButtonWidget(
                                  text: "Create an account"),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already an existing user?",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                " Login",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.primaryColor),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
