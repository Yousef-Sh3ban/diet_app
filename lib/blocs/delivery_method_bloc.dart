import 'package:diet_planner/configuration/app_events.dart';
import 'package:diet_planner/configuration/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryMethodBloc extends Bloc<DeliveryMethodEvent,AppState>{
  DeliveryMethodBloc():super(DeliveryMethodState(isDelivery: false,isPickup:true)){
  on<DeliveryMethodEvent>(_changeDeliveryMethod);
  }

  void _changeDeliveryMethod(DeliveryMethodEvent event,Emitter emit){

    emit(DeliveryMethodState(isDelivery: event.isDelivery,isPickup: event.isPickup));
  }
}




