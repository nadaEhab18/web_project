
import 'package:flutter/material.dart';
import 'package:web_project/pages/Employee/employee_sideBar_menu.dart';
import 'package:web_project/pages/Employee/reject_1.dart';
import 'package:web_project/pages/Employee/reject_2.dart';
import 'package:web_project/pages/Employee/reject_3.dart';
import 'package:web_project/pages/Employee/showRejectRequest.dart';
import 'package:web_project/pages/headBar.dart';
import 'package:web_project/shared/app_colors.dart';

class RejectedRequests extends StatefulWidget {
  const RejectedRequests({Key? key}) : super(key: key);

  @override
  State<RejectedRequests> createState() => _RejectedRequestsState();
}

class _RejectedRequestsState extends State<RejectedRequests> {


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
              const   Expanded(child: EmployeeSideBarMenu(),),

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
                        children: [
                          const  HeadBar(),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const    Text(
                                "طلبات الالتحاق المرفوضة",
                                style: TextStyle(
                                  color: Color(0xff003c60),
                                  fontSize:30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              TextButton(onPressed: (){
                                Navigator.of(context).pop();
                              },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Color((0xffac8600))),
                                    shape: MaterialStateProperty.all<OutlinedBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                                      ),
                                    ),
                                  ),
                                  child: Row(children: [
                                    const  Text('الرجوع  ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                    const   Icon(Icons.arrow_forward_rounded,color: Colors.white,),
                                  ],)),

                            ],
                          ),
                          Divider(
                            color: AppColors.mainColor,
                            thickness: 0.5,
                          ),
                          SizedBox(height: 15,),
                          RejectRule(
                              filterTitle: 'الحالة الاولى : ',
                              filterSubTitle: 'طلاب قدامى تقديرهم غير كافى',
                              pagePath: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return Reject_1();
                                        }
                                    )

                                );
                              }
                          ),
                          RejectRule(
                              filterTitle: 'الحالة الثانية : ',
                              filterSubTitle: 'استبعاد نطاق لطلاب قدامى ',
                              pagePath: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return Reject_2();
                                        }
                                    )

                                );
                              }
                          ),
                          RejectRule(
                              filterTitle: 'الحالة الثالثة : ',
                              filterSubTitle: 'استبعاد نطاق لطلاب جدد',
                              pagePath: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return Reject_3();
                                        }
                                    )

                                );
                              }
                          ),
                          SizedBox(height: 35,),
                          Divider(
                            color: AppColors.mainColor,
                            thickness: 0.5,
                          ),
                          SizedBox(height: 15,),

                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return ShowRejectedRequest();

                                  }));
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Color(0xffac8600)),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                                ),
                              ),
                              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero), // Remove default padding
                              minimumSize: MaterialStateProperty.all<Size>(Size.zero), // Set minimum size to zero
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink the tap target size
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0), // Add custom padding as needed
                              child: Row(
                                mainAxisSize: MainAxisSize.min, // Ensure the Row takes minimum space
                                children: [
                                  const Text(
                                    'عرض الطلبات المرفوضة',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 4.0), // Add space between the text and the image if needed
                                  Image.asset(
                                    'assets/images/rejectRequest.png',
                                    height: 35,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // if (_showDataTable )
                          //   Container(
                          //     width: MediaQuery.of(context).size.width,
                          //     child: SingleChildScrollView(
                          //       child: DataTable(
                          //         decoration: BoxDecoration(
                          //           color: Colors.grey.shade100,
                          //           border: Border.all(color: Colors.grey),
                          //           borderRadius: BorderRadius.circular(20),
                          //         ),
                          //         dataRowColor: MaterialStateProperty.all<Color>(Colors.white),
                          //         columns: const [
                          //           DataColumn(
                          //             label: Text(
                          //               'اسم الطالب', // id
                          //               style: TextStyle(
                          //                 fontWeight: FontWeight.bold,
                          //                 color: Color(0xffac8600),
                          //                 fontSize: 20,
                          //               ),
                          //             ),
                          //           ),
                          //           DataColumn(
                          //             label: Text(
                          //               'الرقم القومى',
                          //               style: TextStyle(
                          //                 fontWeight: FontWeight.bold,
                          //                 color: Color(0xffac8600),
                          //                 fontSize: 20,
                          //               ),
                          //             ),
                          //           ),
                          //           DataColumn(
                          //             label: Text(
                          //               'الكلية',
                          //               style: TextStyle(
                          //                 fontWeight: FontWeight.bold,
                          //                 color: Color(0xffac8600),
                          //                 fontSize: 20,
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //         rows: rejectedRequestData.map((request) => DataRow(
                          //           cells: [
                          //             DataCell(Text(request.name,style: TextStyle(
                          //               fontSize: 23,
                          //             ),
                          //             ),
                          //             ),
                          //             DataCell(Text(request.nationalId,style: TextStyle(
                          //               fontSize: 23,
                          //             ),),),
                          //             DataCell(Text(request.collegeName,style: TextStyle(
                          //               fontSize: 23,
                          //             ),),),
                          //           ],
                          //         )).toList(),
                          //
                          //       ),
                          //     ),
                          //   )
                          // else if (!_showDataTable)
                          //   Center(child: Text('لا يوجد بيانات الآن',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),))
                          // else
                          //   Text('No data available'),



                        ],
                      )),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


typedef onTapped = Function()?;
class RejectRule extends StatelessWidget {
  final String filterTitle;
  final String filterSubTitle;
  final onTapped pagePath;

  const RejectRule({
    Key? key,
    required this.filterTitle,
    required this.filterSubTitle,
    required this.pagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade50,
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(filterTitle,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        subtitle: Text(
          filterSubTitle,
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const Icon(
          Icons.arrow_circle_left_rounded,
          size: 25,
          color: Color(0xffac8600),
        ),
        onTap: pagePath,
      ),
    );
  }
}
