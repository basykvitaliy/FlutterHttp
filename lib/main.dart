import 'package:flutter/material.dart';
import 'package:flutter_Nasa/bloc/main/main_bloc.dart';
import 'package:flutter_Nasa/repository/Repository.dart';
import 'package:flutter_Nasa/screens/MainScreen.dart';
import 'package:flutter_Nasa/screens/SplashScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/detail/detail_bloc.dart';
import 'model/Countries.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Repository _repository = Repository();
  Countries _countries;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MainBloc(repository: _repository)..add(LoadCountryEvent())),
          BlocProvider(create: (context) => DetailBloc(countries: _countries)..add(DetailLoadEvent())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SplashScreen(),
        ));
  }
}

