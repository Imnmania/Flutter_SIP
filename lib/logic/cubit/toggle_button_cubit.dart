import 'package:bloc/bloc.dart';

part 'toggle_button_state.dart';

class ToggleButtonCubit extends Cubit<ToggleButtonState> {
  ToggleButtonCubit()
      : super(ToggleButtonState(
          toggleValue: false,
          intValue: 0,
        ));

  void onToggleButtonPress({required bool value, required intValue}) {
    emit(state.copyWith(toggleValue: value, intValue: intValue + 1));
  }
}
