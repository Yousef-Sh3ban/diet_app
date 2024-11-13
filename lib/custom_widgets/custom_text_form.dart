import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextForm extends StatefulWidget {
  const CustomTextForm({
    super.key,
    required this.hint,
    required this.textEditingController,
    this.ispassword = false,
    required this.validator,
    this.prefix,this.keyboardType,
  });
  final TextInputType ?keyboardType;
  final Widget? prefix;
  final String hint;
  final bool ispassword;
  final TextEditingController textEditingController;
  final String? Function(String? value) validator;
  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType?? TextInputType.text,
      inputFormatters: [
        widget.prefix != null
            ? FilteringTextInputFormatter.digitsOnly
            : FilteringTextInputFormatter.singleLineFormatter,
      ],
      validator: widget.validator,
      obscureText: obscure && widget.ispassword,
      controller: widget.textEditingController,
      decoration: InputDecoration(
        prefixIcon: widget.prefix,
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
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFFEDEDED),
          ),
        ),
        errorBorder: OutlineInputBorder(
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
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: const Color(0xFFBFBFBF),
        ),
      ),
    );
  }
}
