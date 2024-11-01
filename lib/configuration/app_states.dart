abstract class AppState{}

class LoadingState extends AppState{}
class ErrorState extends AppState{
  final String message;

  ErrorState(this.message);
}
class LoadedState extends AppState{
  final dynamic data;

  LoadedState(this.data);
}
class EmptyState extends AppState{}
class InitState extends AppState{}
class DeliveryMethodState extends AppState{//edit
  bool isDelivery;
  bool isPickup;
  DeliveryMethodState({required this.isDelivery,required this.isPickup});
}
//==========================================
//==========================================
class CheckboxState {
  final bool isChecked;

  CheckboxState({required this.isChecked});
}
//==========================================
//=== =======================================
class BranchState  {
  String branch;
  BranchState({required this.branch});
}
