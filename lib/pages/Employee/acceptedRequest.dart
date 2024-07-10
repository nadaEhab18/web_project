
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:web_project/models/acceptRequest_model.dart';
import 'package:web_project/pages/Employee/employee_sideBar_menu.dart';
import 'package:web_project/pages/headBar.dart';
import 'package:web_project/repository/receivedRequest.dart';
import 'package:web_project/shared/app_colors.dart';

class AcceptedRequests extends StatefulWidget {
  const AcceptedRequests({Key? key}) : super(key: key);

  @override
  State<AcceptedRequests> createState() => _AcceptedRequestsState();
}

class _AcceptedRequestsState extends State<AcceptedRequests> {


  bool _showDataTable = false;

  List<AcceptedStudentModel> acceptedRequestData = [];

  @override
  void initState() {
    super.initState();
    _fetchAcceptRequestsData();
  }

  Future<void> _fetchAcceptRequestsData() async {
    try {
      Response response = await RecieviedRequestRepository().getAcceptRequest();
      setState(() {
        acceptedRequestData = List<AcceptedStudentModel>.from(
          response.data.map((model) => AcceptedStudentModel.fromJson(model)),
        );
      });

      setState(() {
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
                    child: SingleChildScrollView(
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
                                    _fetchAcceptRequestsData();
                                  },
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                                      ),
                                    ),
                                  ),
                                  child: const Text('طلبات الالتحاق المقبولة',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:Color(0xff003c60)),),
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



                          if (_showDataTable )
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
                                        'الكلية',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffac8600),
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                  rows: acceptedRequestData.map((request) => DataRow(
                                    cells: [
                                      DataCell(Text(request.name,style: TextStyle(
                                        fontSize: 23,
                                      ),
                                      ),
                                      ),
                                      DataCell(Text(request.nationalId,style: TextStyle(
                                        fontSize: 23,
                                      ),),),
                                      DataCell(Text(request.collegeName,style: TextStyle(
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
              ),

            ],
          ),
        ),
      ),
    );
  }
}


