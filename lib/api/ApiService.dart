import 'package:dio/dio.dart';

import '../model/activity_data_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<ActivityDataModel>> fetchActivities([int? page]) async {
    try {
      final response = await Dio().get(
        'https://jsonplaceholder.typicode.com/posts',
        options: Options(
          headers: {
            'User-Agent': 'Dart/3.0 (Flutter)',
            'Accept': 'application/json',
          },
        ),
      );
      print('Status Code: ${response.statusCode}');
      print('Response Data: ${response.data}');

      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => ActivityDataModel.fromJson(e))
            .toList();
      } else {
        throw Exception('Server returned ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Dio type: ${e.type}');
      print('Dio response: ${e.response?.data}');
      throw Exception('Failed to load posts: ${e.message}');
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('Unexpected error: $e');
    }
  }
}
