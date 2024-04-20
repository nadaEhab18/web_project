import 'package:flutter/material.dart';
import 'package:web_project/pages/Employee/employee_sideBar_menu.dart';
import 'package:web_project/pages/headBar.dart';
import 'package:web_project/shared/app_colors.dart';
import 'package:web_project/widgets/sideBar_menu.dart';


class System extends StatefulWidget {
  const System({Key? key}) : super(key: key);

  @override
  State<System> createState() => _SystemState();
}

class _SystemState extends State<System> {
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
                                "نظام قاعدة التنسيق",
                                style: TextStyle(
                                  color: Color(0xff003c60),
                                  fontSize:30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: AppColors.mainColor,
                            thickness: 0.5,
                          ),
                          SizedBox(height: 15,),
                          Container(
                            width: MediaQuery.of(context).size.width,

                            child: DataTable(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(20),),
                                dataRowColor: MaterialStateProperty.all(Colors.white),
                                columns: const [
                              const    DataColumn(
                                    label: Text(
                                      '  ', // id
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffac8600),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'الاسم',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffac8600),
                                        fontSize: 23,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'الرقم القومى',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffac8600),
                                        fontSize: 23,

                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      ' ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffac8600),
                                      ),
                                    ),
                                  ), // CRUD operations
                                ], rows: [
                              DataRow(cells: [
                                DataCell(Text('1',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                  ),)),
                                DataCell(Text('استاذ رمضان',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20,
                                  ),)),
                                DataCell(Text('12345678901234',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20,

                                  ),
                                ),
                                ),
                                DataCell(Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.green,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.delete, color: Colors.red),
                                    ),
                                  ],
                                )),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('2')),
                                DataCell(Text('استاذ رمضان',style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,

                                ),)),
                                DataCell(Text('12345678901234',style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,

                                ),)),
                                DataCell(Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.edit, color: Colors.green),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                )),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('3')),
                                DataCell(Text('استاذ رمضان',style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,

                                ),),),
                                DataCell(Text('12345678901234',style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,

                                ),),),
                                DataCell(Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.edit, color: Colors.green),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                )),
                              ]),

                            ]),
                          ),
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
