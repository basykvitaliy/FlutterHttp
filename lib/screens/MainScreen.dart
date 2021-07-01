
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_Nasa/bloc/main/main_bloc.dart';
import 'package:flutter_Nasa/repository/Repository.dart';
import 'package:flutter_Nasa/screens/DetailScreen.dart';
import 'package:flutter_Nasa/widget/ShimmerWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MainScreen extends StatelessWidget {
  DateTime backCtnPressTime;
  final _keys = GlobalKey<FormState>();
  MainBloc mainBloc;
  Repository _repository = Repository();
  @override
  Widget build(BuildContext context) {
    mainBloc = BlocProvider.of<MainBloc>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Countries"),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            if(state is MainLoadingState){
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (_, items) {
                  return buildListShimmer();
                },);
            }
            if(state is MainLoadedState){
              return ListView.builder(
                itemCount: state.loadedCountry.length + 1,
                itemBuilder: (ctx, index) {
                  if(state.loadedCountry.length > 0){
                    return index == 0 ? _searchBar() : Dismissible(
                      direction: DismissDirection.endToStart,
                      key: ObjectKey(index),
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                  DetailScreen(countries:state.loadedCountry[index])));
                            },
                            title: Text(state.loadedCountry[index].name),
                            subtitle:
                            Row(
                              children: [
                                Text(state.loadedCountry[index].subregion),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(state.loadedCountry[index].alpha2Code),
                              ],
                            ),
                            leading:
                            Container(
                                width: 50, height: 50, child: SvgPicture.network(state.loadedCountry[index].flag)
                            ),
                          ),
                        ],
                      ),
                      background: Container(
                        alignment: Alignment.centerRight,
                        color: Colors.red,
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                    );
                  }
                  return Column();
                },
              );
            }
            if(state is  MainErrorState){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("What`s not wrong!!!",
                    style: TextStyle(fontSize: 18),),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue
                      ),
                        child: FlatButton(
                            onPressed: ()async{
                              await mainBloc.add(LoadCountryEvent());
                            },
                            child: Text("Reload", style: TextStyle(color: Colors.white),))),
                  ],
                ),
              );
            }
            return Column();
          },
        ),
      ),
    );
  }

   _searchBar() {
    return Form(
      key: _keys,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: TextFormField(
          decoration: InputDecoration(
              hintText: "Search"),
          onChanged: (text)async {
            text = text.toLowerCase();
            final countries = await _repository.getAllCountry();
          },
        ),
      ),
    );
  }

  Widget buildListShimmer() {
    return Column(
      children: [
        ListTile(
          title: Align(
              alignment: Alignment.centerLeft,
              child: ShimmerWidget.rectangular(height: 16, width: 30,)),
          subtitle: ShimmerWidget.rectangular(height: 16,),
          leading: ShimmerWidget.circular(height: 50, width: 50,),
        ),
      ],
    );
  }

  Future<bool> onWillPop()async{
    DateTime currentTime = DateTime.now();
    bool backButton = await backCtnPressTime == null || currentTime.difference(backCtnPressTime) > Duration(seconds: 3);
    if(backButton){
      backCtnPressTime = currentTime;
      Fluttertoast.showToast(msg: "Dooble click");
      return false;

    }
    return true;
  }
}
