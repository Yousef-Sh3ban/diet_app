import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key, required this.hint, this.ispassword = false});
  final String hint;
  final bool ispassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscure = true;


  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure&&widget.ispassword,
      decoration: InputDecoration(
        suffixIcon: widget.ispassword
            ? MaterialButton(
                onPressed: () {
                  setState(() {
                  obscure = !obscure;
                  });
                },
                child: SvgPicture.asset(
                  "assets/icons/eye.svg",
                  height: 24,
                  width: 24,
                ),
              )
            : const SizedBox(),
        prefix: const SizedBox(
          width: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFFEDEDED),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFFEDEDED),
          ),
        ),
        hintText: widget.hint,
        hintStyle: GoogleFonts.poppins(
          fontSize:14 ,
          fontWeight: FontWeight.w500,
          color: const Color(0xFFBFBFBF),
        ),
      ),
    );
  }
}
