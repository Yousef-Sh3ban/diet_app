import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninWaysWidget extends StatelessWidget {
  const SigninWaysWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: (){},
          child: Container(
            width: 163,
            height: 56,
            decoration: const BoxDecoration(
                color: Color(0xFFeceff5),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                SvgPicture.asset(
                  "assets/icons/facebook_icon.svg",
                  width: 24,
                  height: 24,
                ),
                Text(
                  "   Facebook",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3B5998)),
                ),
              ],
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
        InkWell(
          onTap: (){},
          child: Container(
            width: 163,
            height: 56,
            decoration: const BoxDecoration(
                color: Color(0xFFebf7ee),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Row(
              children: [
                const SizedBox(
                  width: 40,
                ),
                SvgPicture.asset(
                  "assets/icons/google_icon.svg",
                  width: 24,
                  height: 24,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Google",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF31AA52)),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
