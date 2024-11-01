import 'package:diet_planner/configuration/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class VoucherWidget extends StatelessWidget {
  const VoucherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppTheme.secondaryColor)),
        focusedBorder:
            OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppTheme.secondaryColor)),
        prefixIcon: Container(
          padding: const EdgeInsets.all(16),
          child: SvgPicture.asset(
            "assets/icons/receipt-item.svg",
          ),
        ),
        enabled: true,
        suffix: Text(
          "Apply",
          style: GoogleFonts.poppins(
              color: AppTheme.primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
        label: Text(
          "Enter the voucher",
          style: GoogleFonts.poppins(
              color: const Color(
                0xFFBFBFBF,
              ),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

