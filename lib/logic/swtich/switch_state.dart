part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  bool toggleSwitch;
  SwitchState({required this.toggleSwitch});

  @override
  List<Object> get props => [toggleSwitch];

  Map<String, dynamic> toJson() {
    return {'toggleSwitch': toggleSwitch};
  }

  factory SwitchState.fromJson(Map<String, dynamic> json) {
    return SwitchState(toggleSwitch: json['toggleSwitch']);
  }
}

class SwitchInitial extends SwitchState {
  SwitchInitial({required bool toggleSwitch}) : super(toggleSwitch: false);
}
