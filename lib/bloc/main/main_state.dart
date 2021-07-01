part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MainInitialState extends MainState {}
class MainLoadingState extends MainState {}

class MainLoadedState extends MainState {
  List<Countries> loadedCountry;

  MainLoadedState({this.loadedCountry}): assert(loadedCountry != null);
}
class MainErrorState extends MainState {}
