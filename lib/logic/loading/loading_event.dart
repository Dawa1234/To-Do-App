part of 'loading_bloc.dart';

class LoadingEvent extends Equatable {
  const LoadingEvent();

  @override
  List<Object> get props => [];
}

class ShowLoading extends LoadingEvent {}

class HideLoading extends LoadingEvent {}
