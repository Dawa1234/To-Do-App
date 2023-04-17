import 'package:todo/logic/bloc_exports.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends HydratedBloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchInitial(toggleSwitch: false)) {
    on<SwitchOffEvent>(_switchOff);
    on<SwitchOnEvent>(_switchOn);
  }

  _switchOff(SwitchOffEvent event, Emitter<SwitchState> emit) {
    emit(SwitchState(toggleSwitch: false));
  }

  _switchOn(SwitchOnEvent event, Emitter<SwitchState> emit) {
    emit(SwitchState(toggleSwitch: true));
  }

  @override
  SwitchState? fromJson(Map<String, dynamic> json) {
    return SwitchState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SwitchState state) {
    return state.toJson();
  }
}
