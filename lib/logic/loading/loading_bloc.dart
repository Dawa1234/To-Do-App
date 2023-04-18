import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(LoadingInitial(isLoading: false)) {
    on<ShowLoading>(_show);
    on<HideLoading>(_hide);
  }

  _hide(HideLoading event, Emitter<LoadingState> emit) {
    log("hide the loading bar");
    emit(LoadingState(isLoading: false));
  }

  _show(ShowLoading event, Emitter<LoadingState> emit) {
    emit(LoadingState(isLoading: true));
  }
}
