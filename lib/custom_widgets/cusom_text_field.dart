import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CusomTextField extends StatefulWidget {
  const CusomTextField({super.key, required this.hint, this.ispassword = false});
  final String hint;
  final bool ispassword;

  @override
  State<CusomTextField> createState() => _CusomTextFieldState();
}

class _CusomTextFieldState extends State<CusomTextField> {
  bool obscure = false;

  TextEditingController fieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      controller: fieldController,
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
