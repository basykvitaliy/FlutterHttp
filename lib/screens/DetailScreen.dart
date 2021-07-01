import 'package:flutter/material.dart';
import 'package:flutter_Nasa/bloc/detail/detail_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:latlong/latlong.dart" as latLng;
import '../model/Countries.dart';

class DetailScreen extends StatelessWidget {

  Countries countries;

  DetailScreen({this.countries});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(countries.name),
      ),
      body: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  child: FlutterMap(
                    options: MapOptions(
                      center: latLng.LatLng(countries.latlng.first, countries.latlng.last),
                      zoom: 5.0,
                    ),
                    layers: [
                      TileLayerOptions(
                          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c']
                      ),
                      MarkerLayerOptions(
                        markers: [
                          Marker(
                            width: 80.0,
                            height: 80.0,
                            point: latLng.LatLng(countries.latlng.first, countries.latlng.last),
                            builder: (ctx) =>
                                Container(
                                  child: Icon(Icons.flag, color: Colors.red,),
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                      child: Row(
                        children: [
                          Icon(Icons.phone),
                          SizedBox(width: 16,),
                          Text(
                            countries.numericCode,
                            style: TextStyle(fontSize: 20, color: Colors.blue),),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                      child: Row(
                        children: [
                          Icon(Icons.border_style),
                          SizedBox(width: 16,),
                          Text(countries.borders == null ? "Borders not found" : countries.borders,
                            style: TextStyle(fontSize: 16, color: Colors.lightBlueAccent),),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                      child: Row(
                        children: [
                          Icon(Icons.monetization_on_outlined),
                          SizedBox(width: 16,),
                          Text(countries.currencies.single.name,
                            style: TextStyle(fontSize: 20, color: Colors.blue),),
                        ],
                      ),
                    ),
                  ],
                ),

              ],
            ),
          );
        }
}
