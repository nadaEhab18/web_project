import 'package:dio/dio.dart';

class RecieviedRequestRepository{
  final Dio _dio = Dio();

  Future<Response> getAcceptRequest() async{
    final response = await _dio.get('http://localhost:4000/employee/all_acceptedstudent',
    );
    print(response);
    return response;
  }

  Future<Response> getRejectRequest() async{
    final response = await _dio.get('http://localhost:4000/employee/all_rejectedstudent',
    );
    print(response);
    return response;
  }

  Future<Response> getReject_1() async{
    final response = await _dio.get('http://localhost:4000/employee/filter_students9',
    );
    print(response);
    return response;
  }

  Future<Response> getReject_2() async{
    final response = await _dio.get('http://localhost:4000/employee/filter_students10',
    );
    print(response);
    return response;
  }

  Future<Response> getReject_3() async{
    final response = await _dio.get('http://localhost:4000/employee/filter_students11',
    );
    print(response);
    return response;
  }






}






