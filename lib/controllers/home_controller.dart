import 'package:flutter/material.dart';
import '../models/BenhModel.dart';
import '../services/api_service.dart';

//Blast
class HomeController {
  final ApiService _apiService = ApiService(endpoint: 'Blast');

  Future<List<Benh>> fetchData() {
    return _apiService.fetchData();
  }

  void onItemTapped(int index, BuildContext context) {
    if (index == 1) {
      Navigator.pushNamed(context, '/signIn');
    }
  }
}
