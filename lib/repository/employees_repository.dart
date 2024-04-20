
import 'package:dio/dio.dart';

class EmployeesRepository {
  final _dio = Dio();

  Future<Response> getEmployeesData() async {
    final res = await _dio.get('http://localhost:4000/admin/getemployees');
    print(res.data);
    return res;
  }
}