part of 'loading_bloc.dart';

class LoadingState extends Equatable {
  bool isLoading;
  LoadingState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

class LoadingInitial extends LoadingState {
  LoadingInitial({required isLoading}) : super(isLoading: isLoading);
}
