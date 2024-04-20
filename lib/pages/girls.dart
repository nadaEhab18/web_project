
import 'package:flutter/material.dart';
import 'package:web_project/pages/headBar.dart';
import 'package:web_project/pages/showNewGirls.dart';
import 'package:web_project/pages/showOldGirls.dart';
import 'package:web_project/shared/app_colors.dart';
import 'package:web_project/widgets/sideBar_menu.dart';


class Girls extends StatefulWidget {
  const Girls({Key? key}) : super(key: key);

  @override
  State<Girls> createState() => _GirlsState();
}

class _GirlsState extends State<Girls> {
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
          const Expanded(child: SideBarMenu(),),



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
                          children: [
                       const     HeadBar(),
                            SizedBox(height: 15,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                             const   Text(
                                  "بيانات الطالبات",
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
                            SizedBox(height: 25,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(onPressed: (){
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) {
                                            return ShowOldGirls();
                                          }
                                      )

                                  );
                                },style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Color((0xffac8600))),
                                  shape: MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                                    ),
                                  ),
                                  minimumSize: MaterialStateProperty.all<Size>(Size(160, 50)), // Set fixed width and height for both buttons

                                ),
                                  child:const Text('الطالبات القدامى',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),),


                                TextButton(onPressed: (){
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) {
                                            return ShowNewGirls();
                                          }
                                      )

                                  );
                                },style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Color((0xffac8600))),
                                  shape: MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                                    ),
                                  ),
                                  minimumSize: MaterialStateProperty.all<Size>(Size(160, 50)), // Set fixed width and height for both buttons

                                ),
                                    child:const Text('الطالبات الجدد',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),)),
                              ],
                            ),
                          ],
                        ),
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


