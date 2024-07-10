import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:web_project/models/filter_model.dart';
import 'package:web_project/pages/Employee/employee_sideBar_menu.dart';
import 'package:web_project/pages/headBar.dart';
import 'package:web_project/repository/newFilter_repository.dart';
import 'package:web_project/shared/app_colors.dart';

class NewFilter_2 extends StatefulWidget {
  const NewFilter_2({Key? key}) : super(key: key);

  @override
  State<NewFilter_2> createState() => _NewFilter_2State();
}

class _NewFilter_2State extends State<NewFilter_2> {
  List<Map<String, dynamic>> _filteredData = [];
  bool _showDataTable = false;
  String? governorateStatus;
  String? collegeId;

  Future<void> _fetchData() async {
    try {
      Response response = await NewFilterRepository().filter_2(governorateStatus!,collegeId!);

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
              const Expanded(
                child: EmployeeSideBarMenu(),
              ),

              /// body
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
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
                                  width:
                                      290, // Adjust the minimum width as needed
                                  height: 60,
                                  child: TextButton(
                                    onPressed: () {
                                      _fetchData();
                                    },
                                    style: ButtonStyle(
                                      //backgroundColor: MaterialStateProperty.all<Color>(Color((0xffac8600))),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20.0), // Adjust the radius as needed
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'قاعدة التنسيق الثانية  ',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff003c60)),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color((0xffac8600))),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20.0), // Adjust the radius as needed
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'الرجوع  ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_rounded,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: AppColors.mainColor,
                              thickness: 0.5,
                            ),
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
                                    label:const Text('الفئات :',style: TextStyle(color: Colors.grey,fontWeight:FontWeight.bold,fontSize: 25),),
                                    prefixIcon:const Icon(Icons.how_to_reg,color: Colors.black,),
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      governorateStatus = val as String;
                                      print('governorateStatus : $governorateStatus');
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || (value as String).isEmpty) {
                                      return 'الرجاء اختيار الفئة';
                                    }
                                    return null;
                                  },
                                  value: governorateStatus,
                                  items: <DropdownMenuItem<String>>[
                                    DropdownMenuItem<String>(
                                      child: Text('الفئة 1',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '1',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('الفئة 2',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '2',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('الفئة 3',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '3',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('الفئة 4',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '4',
                                    ),

                                  ],
                                ),
                              ),
                            ),

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
                                    label:const Text('الكلية :',style: TextStyle(color: Colors.grey,fontWeight:FontWeight.bold,fontSize: 25),),
                                    prefixIcon:const Icon(Icons.how_to_reg,color: Colors.black,),
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      collegeId = val.toString();
                                      print('governorateStatus : $collegeId');
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || (value as String).isEmpty) {
                                      return 'الرجاء اختيار الكلية';
                                    }
                                    return null;
                                  },
                                  value: collegeId,
                                  items: <DropdownMenuItem<String>>[
                                    DropdownMenuItem<String>(
                                      child: Text('كلية الهندسة بحلوان ',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '1',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('كلية التجارة',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '2',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('كلية الهندسة بالمطرية',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '3',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('كلية الفنون الجميلة',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '4',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('كلية الحاسبات و المعلومات ',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '5',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('كلية السياحة و الفنادق',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '6',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('كلية الفنون التطبيقية',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '7',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('كلية التكنولوجيا و التعليم الصناعى',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '8',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('كلية الاقتصاد المنزلى',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '9',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('كلية التربية الفنية',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '10',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('كلية التربية الموسيقية',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '11',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('كلية التربية الرياضية (بنين)',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '12',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('كلية التربية الرياضية (بنات)',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '13',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('كلية الحقوق',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '14',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('كلية الاداب',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '15',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('كلية التربية',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '16',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('كلية الخدمة الاجتماعية',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '17',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('كلية الصيدلة',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '18',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('كلية العلوم ',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '19',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('كلية التمريض',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '20',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('كلية الطب',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '21',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('المعهد القومى للملكية الفكرية',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '22',
                                    ),
                                    DropdownMenuItem<String>(
                                      child: Text('معهد التمريض ',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      value: '23',
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
                                    rows:
                                    _filteredData.map((student) => DataRow(
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
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // int? selectedCollage;
  // List<String> collages = [
  //   "كلية الهندسة بحلوان ",
  //   "كلية التجارة",
  //   "كلية الهندسة بالمطرية",
  //   "كلية الفنون الجميلة",
  //   "كلية الحاسبات و المعلومات ",
  //   "كلية السياحة و الفنادق",
  //   "كلية الفنون التطبيقية",
  //   "كلية التكنولوجيا و التعليم الصناعى",
  //   "كلية الاقتصاد المنزلى",
  //   "كلية التربية الفنية",
  //   "كلية التربية الموسيقية",
  //   "كلية التربية الرياضية (بنين)",
  //   "كلية التربية الرياضية (بنات)",
  //   "كلية الحقوق",
  //   "كلية الاداب",
  //   "كلية التربية",
  //   "كلية الخدمة الاجتماعية",
  //   "كلية الصيدلة",
  //   "كلية العلوم ",
  //   "كلية التمريض",
  //   "كلية الطب",
  //   "المعهد القومى للملكية الفكرية",
  //   "معهد التمريض"
  // ];
}

