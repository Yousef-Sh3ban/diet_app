import 'dart:developer';

import 'package:diet_planner/configuration/app_end_point.dart';
import 'package:diet_planner/configuration/app_events.dart';
import 'package:diet_planner/configuration/app_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<AppEvent, AppState> {
  RegisterBloc() : super(InitState()) {
    on<RegisterEvent>(register);
  }
  //functions
  void register(RegisterEvent event, Emitter emit) async {
    emit(LoadingState());
    try {
      String response = await sendDataToApi(event);
      emit(LoadedState(response));
    } catch (e) {
      log("catch log: ${e.toString()}");
      emit(ErrorState(e.toString()));
    }
  }

  Future<String> sendDataToApi(RegisterEvent event) async {
    Dio dio = Dio();
    dio.options.headers = {//i don't know what is this
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    Response response = await dio.post(
      AppEndPoint.registerFullUrl,
      data: {
        "username": event.registerInfo.name,
        "email": event.registerInfo.email,
        "mobile": event.registerInfo.phone,
        "password": event.registerInfo.password,
        "password_confirmation": event.registerInfo.passwordConfirmaion
      },
      options: Options(//i don't know what is this try to remove it
        followRedirects: false, // Disable auto-following redirects
        validateStatus: (status) =>
            status! < 500, // Accept status codes below 500
      ),
    );

    log('Response status: ${response.statusCode}');
    log('Response data: ${response.data}');
    log(response.toString());
    return response.toString();
  }
}
