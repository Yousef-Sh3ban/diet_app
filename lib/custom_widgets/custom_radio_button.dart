import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final bool selected;
  final Function(bool?) onChanged;
  final double borderWidth;
  final Color borderColor;
  final double size;

  const CustomRadioButton({
    super.key,
    required this.selected,
    required this.onChanged,
    this.borderWidth = 2.0,
    this.borderColor = Colors.blue,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!selected),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        child: selected
            ? Center(
                child: Container(
                  width: size * 0.5,
                  height: size * 0.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: borderColor,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
