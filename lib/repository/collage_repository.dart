import 'package:dio/dio.dart';

class CollagesRepository {
  final _dio = Dio();

  Future<Response> getCollagesData() async {
    final Response res = await _dio.get('http://localhost:4000/admin/getcollege');
    print(res.data);
    return res;
  }

  Future<Response> getEmployeeCollagesData() async {
    final Response res = await _dio.get('http://localhost:4000/colleges/getcolleges');
    print(res.data);
    return res;
  }


}






