
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:web_project/models/filter_model.dart';
import 'package:web_project/pages/Employee/employee_sideBar_menu.dart';
import 'package:web_project/pages/headBar.dart';
import 'package:web_project/repository/oldFolter_repository.dart';
import 'package:web_project/shared/app_colors.dart';

class OldFilter_4 extends StatefulWidget {
  const OldFilter_4({Key? key}) : super(key: key);

  @override
  State<OldFilter_4> createState() => _OldFilter_4State();
}

class _OldFilter_4State extends State<OldFilter_4> {


  List<Map<String, dynamic>> _filteredData = [];
  bool _showDataTable = false;
  String? gpaId;



  Future<void> _fetchData() async {
    try {
      Response response = await OldFilterRepository().filter_4(gpaId!);

      NewFilterModel filterModel = NewFilterModel.fromJson(response.data);

      setState(() {
        _filteredData = filterModel.insertedStudents.map((student) => student.toJson()).toList();
        _showDataTable = true;
      });
    } catch (e) {
      // Handle error
      print("Error fetching data: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// side menu
              const Expanded(child: EmployeeSideBarMenu()),

              /// body
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeadBar(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 290, // Adjust the minimum width as needed
                              height: 60,
                              child: TextButton(
                                onPressed: () {
                                  _fetchData();
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                                    ),
                                  ),
                                ),
                                child: const Text('قاعدة التنسيق الرابعة  ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:Color(0xff003c60)),),
                              ),
                            ),



                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();

                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Color((0xffac8600))),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Text('الرجوع  ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                  const Icon(Icons.arrow_forward_rounded,color: Colors.white,),
                                ],
                              ),
                            ),

                          ],
                        ),

                        Divider(
                          color: AppColors.mainColor,
                          thickness: 0.5,
                        ),

                        // Conditionally show DataTable

                        SizedBox(height: 20,),


                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.5,
                                color: Colors.grey.shade400,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: DropdownButtonFormField(
                              dropdownColor: Colors.white,
                              decoration: InputDecoration(
                                label:const Text('التقدير :',style: TextStyle(color: Colors.grey,fontWeight:FontWeight.bold,fontSize: 25),),
                                prefixIcon:const Icon(Icons.how_to_reg,color: Colors.black,),
                                border: InputBorder.none,
                              ),
                              onChanged: (val) {
                                setState(() {
                                  gpaId = val.toString();
                                  print('governorateStatus : $gpaId');
                                });
                              },
                              validator: (value) {
                                if (value == null || (value as String).isEmpty) {
                                  return 'الرجاء اختيار الفئة';
                                }
                                return null;
                              },
                              value: gpaId,
                              items: <DropdownMenuItem<String>>[
                                DropdownMenuItem<String>(
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text('ناجح',
                                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                  ),
                                  value: '5',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('جيد',
                                    textDirection: TextDirection.rtl,

                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                  value: '6',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('جيد جداً',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                  value: '7',
                                ),
                                DropdownMenuItem<String>(
                                  child: Text('امتياز',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                  value: '8',
                                ),

                              ],
                            ),
                          ),
                        ),



                        if (_showDataTable && _filteredData.isNotEmpty)
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: SingleChildScrollView(
                              child: DataTable(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                dataRowColor: MaterialStateProperty.all<Color>(Colors.white),
                                columns: const [
                                  DataColumn(
                                    label: Text(
                                      'اسم الطالب', // id
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffac8600),
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'الرقم القومى',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffac8600),
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'رقم المبنى',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffac8600),
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'الكلية',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffac8600),
                                        fontSize: 20,
                                      ),
                                    ),
                                  ), // CRUD operations
                                ],
                                rows: _filteredData.map((student) => DataRow(
                                  cells: [
                                    DataCell(Text(student['name'],style: TextStyle(
                                      fontSize: 23,
                                    ),
                                    ),
                                    ),
                                    DataCell(Text(student['nationalID'],style: TextStyle(
                                      fontSize: 23,
                                    ),),),
                                    DataCell(Text(student['building_number'].toString(),style: TextStyle(
                                      fontSize: 23,
                                    ),),),
                                    DataCell(Text(student['college_name'],style: TextStyle(
                                      fontSize: 23,
                                    ),),),
                                  ],
                                )).toList(),

                              ),
                            ),
                          )
                        else if (!_showDataTable)
                          Center(child: Text('لا يوجد بيانات الآن',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),))
                        else
                          Text('No data available'),

                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


