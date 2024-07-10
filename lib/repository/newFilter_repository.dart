import 'package:dio/dio.dart';

class NewFilterRepository{
  final Dio _dio = Dio();

  Future<Response> filter_1() async{
    final response = await _dio.post('http://localhost:4000/employee/filterAndInsertStudents1',
    );
    print(response);
    return response;
  }

  Future<Response> filter_2(String governorateStatus, String collegeId) async{
    final response = await _dio.post('http://localhost:4000/employee/filterAndInsertStudents2',
      data: {
        "governorateStatus": governorateStatus,
        "collegeId": collegeId
      }
    );
    print(response);
    return response;
  }

  Future<Response> filter_3() async{
    final response = await _dio.post('http://localhost:4000/employee/filterAndInsertStudents3',
    );
    print(response);
    return response;
  }

  Future<Response> filter_4() async{
    final response = await _dio.post('http://localhost:4000/employee/filterAndInsertStudents4',
    );
    print(response);
    return response;
  }




}

