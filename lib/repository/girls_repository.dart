
import 'package:dio/dio.dart';

class OldGirlsRepository {
  final _dio = Dio();

  Future<Response> getOldGirlsData() async {
    final Response res = await _dio.get('http://localhost:4000/admin/femaleStudents');
    print(res.data);
    return res;
  }
}

