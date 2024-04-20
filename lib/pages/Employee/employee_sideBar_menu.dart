import 'package:flutter/material.dart';
import 'package:web_project/pages/Employee/employee_boysPage.dart';
import 'package:web_project/pages/Employee/employee_buildingsPage.dart';
import 'package:web_project/pages/Employee/employee_collagePage.dart';
import 'package:web_project/pages/Employee/employee_girlsPage.dart';
import 'package:web_project/pages/Employee/employee_homePage.dart';
import 'package:web_project/pages/Employee/employee_systemPage.dart';
import 'package:web_project/shared/app_colors.dart';

class EmployeeSideBarMenu extends StatefulWidget {
  const EmployeeSideBarMenu({Key? key}) : super(key: key);

  @override
  State<EmployeeSideBarMenu> createState() => _EmployeeSideBarMenuState();
}

class _EmployeeSideBarMenuState extends State<EmployeeSideBarMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        color: AppColors.mainColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext context) {
                          return EmployeeHomePage();
                        }
                    )

                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                child:
                  Image.asset('assets/images/logo.png',
                  height: 220,),
              ),
            ),


            Divider(
              color: AppColors.secColor,
              thickness: 2,
            ),

            DrawerList(title: "الطلاب", icon: "assets/images/businessman.png", press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) {
                        return EmployeeBoys();
                      }
                  )

              );
            }) ,
            Divider(
              color: AppColors.secColor,
              thickness: 2,
            ),
            DrawerList(title: "الطالبات", icon: "assets/images/businesswoman.png", press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) {
                        return EmployeeGirls();
                      }
                  )

              );


            }) ,
            Divider(
              color: AppColors.secColor,
              thickness: 2,
            ),
            DrawerList(title: "النظام", icon: "assets/images/system.png", press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) {
                        return EmployeeSystem();
                      }
                  )

              );
            }),

            Divider(
              color: AppColors.secColor,
              thickness: 2,
            ),
            DrawerList(title: "المبانى", icon: "assets/images/buildings.png", press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) {
                        return EmployeeBuildings();
                      }
                  )

              );

            }),

            Divider(
              color: AppColors.secColor,
              thickness: 2,
            ),
            DrawerList(title: "الكليات", icon: "assets/images/city.png", press: () {

              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) {
                        return EmployeeCollages();
                      }
                  )

              );
            }),


          ],
        ),
      ),
    );
  }
}


class DrawerList extends StatelessWidget {
final String title , icon ;
final VoidCallback press ;

const DrawerList({Key? key, required this.title, required this.icon, required this.press}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(icon,
      color: AppColors.white,
      ),
      title: Text(title,
      style: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      ),
      onTap: press,
    );
  }
}
