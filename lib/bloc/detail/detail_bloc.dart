import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_Nasa/model/Countries.dart';
import 'package:flutter_Nasa/repository/Repository.dart';
import 'package:meta/meta.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {

  DetailBloc({this.countries}) : super(DetailInitialState());

  Countries countries;
  @override
  Stream<DetailState> mapEventToState(DetailEvent event,) async* {
    if(event is DetailLoadEvent){
      yield DetailInitialState();
      try{

        yield DetailLoadedState(countries: countries);
      }catch(e){
        yield DetailErrorState();
      }
    }
  }
}
