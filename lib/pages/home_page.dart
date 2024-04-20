
import 'package:flutter/material.dart';
import 'package:web_project/pages/dashboard.dart';
import 'package:web_project/shared/app_colors.dart';
import 'package:web_project/widgets/sideBar_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
           const   Expanded(child: SideBarMenu(),),



              /// body
           const   Expanded(
                flex: 4,
                child:  Dashboard(),),
            ],
          ),
        ),
      ),
    );
  }
}
