
import 'package:dio/dio.dart';

class BuildingsRepository {
  final _dio = Dio();

  Future<Response> getBuildingsData() async {
    final res = await _dio.get('http://localhost:4000/employee/getbuildings');
    print(res.data);
    return res;
  }
}