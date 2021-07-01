part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class LoadCountryEvent extends MainEvent{}
class ReloadCountryEvent extends MainEvent{}