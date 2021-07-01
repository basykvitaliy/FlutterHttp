import 'dart:convert';

import 'package:flutter_Nasa/model/Countries.dart';
import 'package:http/http.dart' as http;

class ApiService{
  var url = Uri.parse("https://restcountries.eu/rest/v2/region/europe");

  Future<List<Countries>> getCountry() async {

    var response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((e) => Countries.fromJson(e)).toList();
    }
    throw Exception("Http cal not made");

  }
}