import 'dart:developer';

import 'package:diet_planner/blocs/register_bloc.dart';
import 'package:diet_planner/configuration/app_events.dart';
import 'package:diet_planner/configuration/app_states.dart';
import 'package:diet_planner/models/register_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});
  final RegisterModel registerInfo = RegisterModel(
      name: "testads1",
      email: "taest4567890@gmail.com",
      phone: "01064653834",
      password: "123456789",
      passwordConfirmaion: "123456789");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterBloc(),
        child: BlocBuilder<RegisterBloc, AppState>(builder: (context, state) {
          if(state is LoadedState){
            print("success");
            log("success");
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  BlocProvider.of<RegisterBloc>(context)
                      .add(RegisterEvent(registerInfo));
                },
                child: Center(
                  child: Container(
                    color: Colors.blue,
                    height: 80,
                    width: 80,
                    child: const Text("register"),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
