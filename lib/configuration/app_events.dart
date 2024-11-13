import 'package:diet_planner/models/register_model.dart';

abstract class AppEvent{}
class ClickEvent extends AppEvent{}
class AddEvent extends AppEvent{
  final dynamic data;
  AddEvent(this.data);
}
class RemoveEvent extends AppEvent{
  final dynamic data;
  RemoveEvent(this.data);
}
class SearchEvent extends AppEvent{}
class GetDataEvent extends AppEvent{} 
class RegisterEvent extends AppEvent{
  RegisterModel registerInfo;
  RegisterEvent(this.registerInfo);
}

//==========================================
//==========================================

class DeliveryMethodEvent{
  bool isDelivery;
  bool isPickup;
  DeliveryMethodEvent({required this.isDelivery,required this.isPickup});
}

//==========================================
//==========================================

class ToggleCheckboxEvent {
  ToggleCheckboxEvent(this.isChecked);
  bool isChecked;
}
//==========================================
//==========================================
class BranchEvent{
  String branch;
  BranchEvent({required this.branch});
}
