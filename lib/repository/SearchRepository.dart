import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_Nasa/model/Countries.dart';

class SearchRepository{

  Future<List<Countries>> searchCountry(String query) async {
    var url = Uri.parse("https://restcountries.eu/rest/v2/region/europe");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((e) => Countries.fromJson(e)).toList();
    }
    throw Exception("Http cal not made");

  }
}