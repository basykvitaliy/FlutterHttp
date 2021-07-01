import 'package:flutter_Nasa/model/Countries.dart';
import 'package:flutter_Nasa/repository/ApiService.dart';

class Repository{
  ApiService _service = ApiService();
  Future<List<Countries>> getAllCountry() => _service.getCountry();
}