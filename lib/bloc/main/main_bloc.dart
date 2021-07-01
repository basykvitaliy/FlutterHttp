import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_Nasa/model/Countries.dart';
import 'package:flutter_Nasa/repository/Repository.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({this.repository}) : assert(repository != null), super(MainInitialState());

  final Repository repository;


  @override
  Stream<MainState> mapEventToState(MainEvent event,) async* {
    if(event is LoadCountryEvent){
      yield MainLoadingState();
      try{
        final List<Countries> _loadedCountryList = await repository.getAllCountry();
        yield MainLoadedState(loadedCountry: _loadedCountryList);
      }catch(e){
        yield MainErrorState();
      }
    }
  }
}
