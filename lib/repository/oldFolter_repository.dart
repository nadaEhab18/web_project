import 'package:dio/dio.dart';

class OldFilterRepository{
  final Dio _dio = Dio();

  Future<Response> filter_1() async{
    final response = await _dio.post('http://localhost:4000/employee/filterAndInsertStudents5',
    );
    print(response);
    return response;
  }

  Future<Response> filter_2(String governorateStatus, String gpaId) async{
    final response = await _dio.post('http://localhost:4000/employee/filterAndInsertStudents6',
        data: {
          "governorateStatus": governorateStatus,
          "gpaId": gpaId
        }
    );
    print(response);
    return response;
  }

  Future<Response> filter_3(String gpa_id) async{
    final response = await _dio.post('http://localhost:4000/employee/filterAndInsertStudents7',
      data: {
        "gpa_id": gpa_id

      }
    );
    print(response);
    return response;
  }

  Future<Response> filter_4(String gpa_id) async{
    final response = await _dio.post('http://localhost:4000/employee/filterAndInsertStudents8',
    data: {
      "gpa_id": gpa_id

    }
    );
    print(response);
    return response;
  }




}




