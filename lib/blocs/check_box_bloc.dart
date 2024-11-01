import 'package:diet_planner/configuration/app_events.dart';
import 'package:diet_planner/configuration/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckBoxBloc extends Bloc<ToggleCheckboxEvent, CheckboxState> {
  CheckBoxBloc() : super(CheckboxState(isChecked: false)) {
    on<ToggleCheckboxEvent>(_changeCheckboxState);
  }

  bool? isChecked;
  void _changeCheckboxState(ToggleCheckboxEvent event, Emitter emit) {
    emit(CheckboxState(isChecked: event.isChecked));
  }
}




