import 'package:diet_planner/blocs/cart_bloc.dart';
import 'package:diet_planner/configuration/app_theme.dart';
import 'package:diet_planner/screens/cart_screen.dart';
import 'package:diet_planner/screens/home_screen.dart';
import 'package:diet_planner/screens/order_screen.dart';
import 'package:diet_planner/screens/plans_screen.dart';
import 'package:diet_planner/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({super.key});

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int currentpage = 0;
  List screens = [
    const HomeScreen(),
    const PlansScreen(),
    BlocProvider(create: (context) => CartBloc(), child: const CartScreen()),
    OrderScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 65,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppTheme.primaryColor,
          unselectedItemColor: const Color(0xFFBFBFBF),
          backgroundColor: Colors.white,
          selectedLabelStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 10),
          unselectedLabelStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 10),
          showUnselectedLabels: true,
          currentIndex: currentpage,
          onTap: (int index) {
            setState(() {
              currentpage = index;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset("assets/icons/Frame 2.svg"),
                icon: SvgPicture.asset("assets/images/app_logo_grey.svg"),
                label: "Home"),
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              activeIcon: SvgPicture.asset(
                "assets/icons/reserve.svg",
                color: AppTheme.primaryColor,
              ),
              icon: SvgPicture.asset(
                "assets/icons/reserve.svg",
              ),
              label: "Plans",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/bag.svg",
              ),
              activeIcon: SvgPicture.asset(
                "assets/icons/bag.svg",
                color: AppTheme.primaryColor,
              ),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/reserve.svg",
              ),
              activeIcon: SvgPicture.asset(
                "assets/icons/reserve.svg",
                color: AppTheme.primaryColor,
              ),
              label: "Order",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/profile.svg",
              ),
              activeIcon: SvgPicture.asset(
                "assets/icons/profile.svg",
                color: AppTheme.primaryColor,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
      body: screens[currentpage],
    );
  }
}
