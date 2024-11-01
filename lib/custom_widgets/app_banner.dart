import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({super.key,this.svgPath,required this.logoPath});
  final String? svgPath;
  final String logoPath;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: double.infinity,
            child: Image.asset(
              "assets/images/login_page_bar.png",
              fit: BoxFit.cover,
            )),
        Positioned(
            top: 67,
            left: 0,
            right: 0,
            child: Image.asset(
              logoPath,
              width: 75,
              height: 89,
            )),
        Positioned(
            top: 57,
            left: 24,
            child: svgPath != null
                ? Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      color: const Color(0xFFFFFFFF),
                      border: Border.all(
                        color: const Color(0xFFEDEDED),
                      ),
                    ),
                    child: Center(
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(svgPath!)),
                    ),
                  )
                : const SizedBox())
      ],
    );
  }
}
