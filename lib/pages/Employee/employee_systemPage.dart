import 'package:flutter/material.dart';
import 'package:web_project/pages/Employee/acceptedRequest.dart';
import 'package:web_project/pages/Employee/employee_sideBar_menu.dart';
import 'package:web_project/pages/Employee/newStudents_filter.dart';
import 'package:web_project/pages/Employee/oldStudents_flitter.dart';
import 'package:web_project/pages/Employee/rejectedRequest.dart';
import 'package:web_project/pages/headBar.dart';
import 'package:web_project/shared/app_colors.dart';

class EmployeeSystem extends StatefulWidget {
  const EmployeeSystem({Key? key}) : super(key: key);

  @override
  State<EmployeeSystem> createState() => _EmployeeSystemState();
}

class _EmployeeSystemState extends State<EmployeeSystem> {
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
                          const HeadBar(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "نظام قاعدة التنسيق",
                                style: TextStyle(
                                  color: Color(0xff003c60),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: AppColors.mainColor,
                            thickness: 0.5,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return OldStudentsFilter();
                                  }));
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color((0xffac8600))),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          20.0), // Adjust the radius as needed
                                    ),
                                  ),
                                  minimumSize: MaterialStateProperty.all<Size>(Size(
                                      160,
                                      50)), // Set fixed width and height for both buttons
                                ),
                                child: const Text(
                                  'الطلاب القدامى',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                      return NewStudentsFilter();
                                    }));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color((0xffac8600))),
                                    shape: MaterialStateProperty.all<
                                        OutlinedBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20.0), // Adjust the radius as needed
                                      ),
                                    ),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(Size(
                                            160,
                                            50)), // Set fixed width and height for both buttons
                                  ),
                                  child: const Text(
                                    'الطلاب الجدد',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  )),
                            ],
                          ),
                          SizedBox(height: 25,),
                          Divider(thickness: 1,
                          color: Color(0xff003c60),),
                          SizedBox(height: 25,),

                          ListTile(
                            title: Text('طلبات الالتحاق المستلمة',
                                style: TextStyle(
                                color: Color(0xff003c60),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                            ),
                            leading:  Image.asset(
                              'assets/images/requests.png',
                              height: 35,
                              color: Color(0xffac8600),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Card(
                            color: Colors.grey.shade50,
                            margin: EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text('طلبات الالتحاق المقبولة',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                              leading:  Image.asset(
                                'assets/images/acceptRequest.png',
                                height: 35,
                                color: Color(0xffac8600),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return AcceptedRequests();
                                    }));

                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Card(
                            color: Colors.grey.shade50,
                            margin: EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text('طلبات الالتحاق المرفوضة',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                              leading:  Image.asset(
                                'assets/images/rejectRequest.png',
                                height: 35,
                                color: Color(0xffac8600),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return RejectedRequests();
                                    }));

                              },
                            ),
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
