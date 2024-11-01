import 'package:diet_planner/configuration/app_events.dart';
import 'package:diet_planner/configuration/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BranchBloc extends Bloc<BranchEvent,BranchState>{
  BranchBloc():super(BranchState(branch: "Select...")){
  on<BranchEvent>(_branchChoice);
  }

  void _branchChoice(BranchEvent event,Emitter emit){

    emit(BranchState(branch: event.branch));
  }
}




