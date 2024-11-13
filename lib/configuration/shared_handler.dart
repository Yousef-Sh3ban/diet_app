import 'package:diet_planner/models/register_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedHandler {
  SharedHandler._privateConstructor();
  SharedPreferences? _perfInstance;
  static final SharedHandler _handlerInstance =
      SharedHandler._privateConstructor();

  factory SharedHandler() {
    return _handlerInstance;
  }

  Future<void> me() async {
    _perfInstance ??= await SharedPreferences.getInstance();
  }

  setDate(RegisterModel date) async {
    if (_perfInstance == null) {
      await me();
    }
    await _perfInstance!.setString("name", date.name);
    await _perfInstance!.setString("email", date.email);
    await _perfInstance!.setString("phone", date.phone);
    await _perfInstance!.setString("password", date.password);
  }

  Future<RegisterModel> getDate() async {
    if (_perfInstance == null) {
      await me();
    }
    return RegisterModel(
      name: '${_perfInstance?.getString("name")}',
      email: '${_perfInstance?.getString("email")}',
      phone: '${_perfInstance?.getString("phone")}',
      password: '${_perfInstance?.getString("password")}',
      passwordConfirmaion: 'nothing here',
    );
  }
}
