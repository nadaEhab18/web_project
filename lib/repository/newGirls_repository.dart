import 'package:dio/dio.dart';

class NewGirlsRepository {
  final _dio = Dio();

  Future<Response> getNewGirlsData() async {
    final Response res = await _dio.get('http://localhost:4000/admin/femaleStudents2');
    print(res.data);
    return res;
  }
}

