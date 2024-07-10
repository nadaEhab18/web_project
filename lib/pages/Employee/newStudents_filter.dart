
import 'package:flutter/material.dart';
import 'package:web_project/pages/Employee/employee_sideBar_menu.dart';
import 'package:web_project/pages/Employee/newFilter_1.dart';
import 'package:web_project/pages/Employee/newFilter_2.dart';
import 'package:web_project/pages/Employee/newFilter_3.dart';
import 'package:web_project/pages/Employee/newFilter_4.dart';
import 'package:web_project/pages/headBar.dart';
import 'package:web_project/shared/app_colors.dart';

class NewStudentsFilter extends StatefulWidget {
  const NewStudentsFilter({Key? key}) : super(key: key);

  @override
  State<NewStudentsFilter> createState() => _NewStudentsFilterState();
}

class _NewStudentsFilterState extends State<NewStudentsFilter> {
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
                          FilterRule(
                            filterTitle: 'قاعدة التنسيق الاولى : ',
                            filterSubTitle: 'طلاب ذوى الاحتياجات الخاصة',
                              pagePath: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return NewFilter_1();
                                        }
                                    )

                                );
                              }
                          ),
                          FilterRule(
                            filterTitle: 'قاعدة التنسيق الثانية : ',
                            filterSubTitle: 'طلاب مصريين ذوى سكن عادى',
                              pagePath: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return NewFilter_2();
                                        }
                                    )

                                );
                              }
                          ),
                          FilterRule(
                            filterTitle: 'قاعدة التنسيق الثالثة : ',
                            filterSubTitle: 'طلاب مصريين أو وافدين ذوى سكن مميز',
                              pagePath: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return NewFilter_3();
                                        }
                                    )

                                );
                              }
                          ),
                          FilterRule(
                            filterTitle: 'قاعدة التنسيق الرابعة : ',
                            filterSubTitle: 'طلاب مركز الواحات البحرية (الجيزة)\nطلاب مركز كفر شكر (القليوبية)',
                              pagePath: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return NewFilter_4();
                                        }
                                    )

                                );
                              }
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


typedef onTapped = Function()?;
class FilterRule extends StatelessWidget {
  final String filterTitle;
  final String filterSubTitle;
  final onTapped pagePath;

  const FilterRule({
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
