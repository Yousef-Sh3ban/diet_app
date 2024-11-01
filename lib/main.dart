import 'package:diet_planner/blocs/branch_bloc.dart';
import 'package:diet_planner/blocs/cart_bloc.dart';
import 'package:diet_planner/blocs/check_box_bloc.dart';
import 'package:diet_planner/blocs/delivery_method_bloc.dart';
import 'package:diet_planner/screens/main_screens.dart';
import 'package:diet_planner/screens/forgot_password_screen.dart';
import 'package:diet_planner/screens/login_screen.dart';
import 'package:diet_planner/screens/register_screen.dart';
import 'package:diet_planner/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'configuration/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BranchBloc>(create: (context) => BranchBloc()),
        BlocProvider<CheckBoxBloc>(create: (context) => CheckBoxBloc()),
        BlocProvider<DeliveryMethodBloc>(
            create: (context) => DeliveryMethodBloc()),
        BlocProvider<CartBloc>(create: (context) => CartBloc()),
      ],
      child: MaterialApp(
        routes: {
          AppRoutes.mainScreens: (context) =>
              const MainScreens(), // No MultiBlocProvider here
          //remove
          AppRoutes.splash: (context) => const SplashScreen(),
          AppRoutes.forgotPassword: (context) => const ForgotPasswordScreen(),
          AppRoutes.login: (context) => const LoginScreen(),
          AppRoutes.register: (context) => const RegisterScreen(),
        },
        initialRoute: AppRoutes.splash,
        theme: ThemeData(
          useMaterial3: false,
          appBarTheme: const AppBarTheme(
            centerTitle: false,
            backgroundColor: Colors.white,
            elevation: 0.5,
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
