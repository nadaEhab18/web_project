import 'package:dio/dio.dart';

class NewBoysRepository {
  final _dio = Dio();

  Future<Response> getNewBoysData() async {
    final res = await _dio.get(
        'http://localhost:4000/admin/maleStudents2'
    );
    print(res.data);
    return res;
  }
}