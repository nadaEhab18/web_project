
import 'package:flutter/material.dart';
import 'package:web_project/pages/headBar.dart';
import 'package:web_project/pages/profile.dart';
import 'package:web_project/shared/app_colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      // margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
       color: AppColors.white,
          borderRadius: BorderRadius.only(
      topRight: Radius.circular(30),
      bottomRight: Radius.circular(30),
    ),
     ),
      child:Column(
        children: [
      const    HeadBar(),
          Expanded(child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Container(
                    child: Column(
                      children: [
                        Container(),
                      ],
                    ),
                  )),
              Expanded(child: Column(
                children: [
                  Expanded(child: const Profile(),
                  ),
                  Expanded(child: Container(),),
                ],
              )
              ),
            ],
          ))
        ],
      ) ,
    );
  }
}
