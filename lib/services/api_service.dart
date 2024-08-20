import '../models/BenhModel.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  final String endpoint;

  ApiService({required this.endpoint});

  static const String baseUrl =
      'https://bff7-171-243-59-113.ngrok-free.app/disease_iden_demo/';

  Future<List<Benh>> fetchData() async {
    try {
      // Append the endpoint to the base URL
      final String apiUrl = '$baseUrl$endpoint';

      final response = await _dio.get(apiUrl,
          options: Options(
            receiveTimeout: const Duration(seconds: 2000),
          ));

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<Benh> benhList =
            data.whereType<Map<String, dynamic>>().map((json) {
          return Benh.fromJson(json);
        }).toList();
        return benhList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
