
import 'package:dio/dio.dart';

class OldBoysRepository {
  final _dio = Dio();

  Future<Response> getOldBoysData() async {
    final res = await _dio.get(
        'http://localhost:4000/admin/maleStudents'
    );
    print(res.data);
    return res;
  }
}
// void main(){
//   BoysRepository().getOldBoysData();
// }



// final _dio = Dio();
//
// Future<List<OldBoys>> getOldBoysData() async {
//
//   // get response from api
//   final res = await http.get(Uri.parse('http://localhost:4000/employee/maleStudents'));
//
//   //
//   if(res.statusCode == 200){
//     // decoding recieved string data into Json data
//     var result = jsonDecode(res.body);
//
//     List jesonRsponse = result['BoysOld'] as List;
//     return jesonRsponse.map((e) => OldBoys.fromJson(e)).toList();
//   }else{
//     throw Exception(res.reasonPhase);
//   }
//   print(res.data);
//   return res;
// }
// }