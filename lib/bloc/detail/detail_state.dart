part of 'detail_bloc.dart';

@immutable
abstract class DetailState {}

class DetailInitialState extends DetailState {}
class DetailLoadedState extends DetailState {
  Countries countries;

  DetailLoadedState({this.countries}): assert(countries != null);
}

class DetailErrorState extends DetailState {}

