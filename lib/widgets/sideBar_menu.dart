
import 'package:flutter/material.dart';
import 'package:web_project/pages/boys.dart';
import 'package:web_project/pages/buildings.dart';
import 'package:web_project/pages/collages.dart';
import 'package:web_project/pages/employees.dart';
import 'package:web_project/pages/girls.dart';
import 'package:web_project/pages/home_page.dart';
import 'package:web_project/pages/system.dart';
import 'package:web_project/shared/app_colors.dart';

class SideBarMenu extends StatefulWidget {
  const SideBarMenu({Key? key}) : super(key: key);

  @override
  State<SideBarMenu> createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {
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
                          return HomePage();
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

            DrawerList(title: 'العاملين', icon: "assets/images/management.png", press: () {

              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Employees();
                      }
                  )

              );


            }),
            Divider(
              color: AppColors.secColor,
              thickness: 2,
            ),

            DrawerList(title: "الطلاب", icon: "assets/images/businessman.png", press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Boys();
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
                        return Girls();
                      }
                  )

              );


            }) ,
            Divider(
              color: AppColors.secColor,
              thickness: 2,
            ),
            DrawerList(title: "المبانى", icon: "assets/images/buildings.png", press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Buildings();
                      }
                  )

              );

            }),
            Divider(
              color: AppColors.secColor,
              thickness: 2,
            ),
            // DrawerList(title: "النظام", icon: "assets/images/system.png", press: () {
            //   Navigator.of(context).push(
            //       MaterialPageRoute(
            //           builder: (BuildContext context) {
            //             return System();
            //           }
            //       )
            //
            //   );
            // }),
            // Divider(
            //   color: AppColors.secColor,
            //   thickness: 2,
            // ),
            DrawerList(title: "الكليات", icon: "assets/images/city.png", press: () {

              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Collages();
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
