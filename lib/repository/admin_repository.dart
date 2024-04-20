import 'package:dio/dio.dart';

class AdminRepository{
  final Dio _dio = Dio();

  Future<Response> AdminLogin(String name, String password) async{
   final response = await _dio.post('http://localhost:4000/admin/login',
    data: {
      "name": name,
      "password":password
    }
    );
    print(response);
    return response;
  }
}