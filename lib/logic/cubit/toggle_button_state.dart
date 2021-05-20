part of 'toggle_button_cubit.dart';

class ToggleButtonState {
  late final bool toggleValue;
  late final int intValue;
  ToggleButtonState({
    required this.toggleValue,
    required this.intValue,
  });

  ToggleButtonState copyWith({
    bool? toggleValue,
    int? intValue,
  }) {
    return ToggleButtonState(
      toggleValue: toggleValue ?? this.toggleValue,
      intValue: intValue ?? this.intValue,
    );
  }
}
