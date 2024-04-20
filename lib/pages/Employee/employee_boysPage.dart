
import 'package:flutter/material.dart';
import 'package:web_project/models/newBoys_model.dart';
import 'package:web_project/models/oldBoys_model.dart';
import 'package:web_project/pages/Employee/emp_showNewBoys.dart';
import 'package:web_project/pages/Employee/emp_showOldBoys.dart';
import 'package:web_project/pages/Employee/employee_sideBar_menu.dart';
import 'package:web_project/pages/headBar.dart';
import 'package:web_project/repository/boys_repository.dart';
import 'package:web_project/repository/newBoys_repository.dart';
import 'package:web_project/shared/app_colors.dart';

class EmployeeBoys extends StatefulWidget {
  const EmployeeBoys({Key? key}) : super(key: key);

  @override
  State<EmployeeBoys> createState() => _EmployeeBoysState();
}

class _EmployeeBoysState extends State<EmployeeBoys> {


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
              const    Expanded(child: EmployeeSideBarMenu(),),



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
                          const    HeadBar(),
                          SizedBox(height: 15,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const   Text(
                                "بيانات الطلاب",
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
                                          return EmpShowOldBoys();
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
                                child:const Text('الطلاب القدامى',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),),


                              TextButton(onPressed: (){
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return EmpShowNewBoys();
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
                                  child:const Text('الطلاب الجدد',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),)),
                            ],
                          ),


                          /// ##################

                          ///*******************

                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    )
    ;
  }
}






class OldBoyys extends StatelessWidget {
  const OldBoyys({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: OldBoysRepository().getOldBoysData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          final dynamic responseData = snapshot.data;
          final List<dynamic> responseList = responseData.data;
          return ListView.builder(
            itemCount: responseList.length,
            itemBuilder: (context, index) {
              final oldMaleModel = OldBoysModel.fromJson(responseList[index]);
              return Directionality(
                textDirection: TextDirection.rtl,
                child: Card(
                  color: Colors.grey.shade50,
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    //     leading:
                    //SizedBox(
                    //   width: 50,
                    //   height: 50,
                    //   child: ClipRRect(
                    //     borderRadius: BorderRadius.circular(15),
                    //     child: Image.network(
                    //       'http://localhost:52652/${oldMaleModel.imageUrl}',
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //     height: 50,
                    //     width: 50,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(15),
                    //         image: DecorationImage(
                    //             fit: BoxFit.cover,
                    //             image: NetworkImage(
                    //                 oldMaleModel.imageUrl
                    //             )
                    //         )
                    //     ),
                    //     child: Image.network(oldMaleModel.imageUrl,height: 50,width: 50,)),
                    title: Text(oldMaleModel.name,style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Gender: ${oldMaleModel.gender}'),
                        Text('Father\'s Name: ${oldMaleModel.fatherName}'),
                        Text('Father\'s Phone: ${oldMaleModel.fatherPhone}'),
                        Text('Department: ${oldMaleModel.department}'),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
        return Center(child: Text('There is an error'));
      },
    );
  }
}

Widget NewBoysData(){
  return FutureBuilder(
    future: NewBoysRepository().getNewBoysData(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (snapshot.hasData) {
        final dynamic responseData = snapshot.data;
        final List<dynamic> responseList = responseData.data;
        return ListView.builder(
          itemCount: responseList.length,
          itemBuilder: (context, index) {
            final newMaleModel = NewBoysModel.fromJson(responseList[index]);
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Card(
                color: Colors.grey.shade50,
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  //     leading:
                  //SizedBox(
                  //   width: 50,
                  //   height: 50,
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(15),
                  //     child: Image.network(
                  //       'http://localhost:52652/${oldMaleModel.imageUrl}',
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //     height: 50,
                  //     width: 50,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(15),
                  //         image: DecorationImage(
                  //             fit: BoxFit.cover,
                  //             image: NetworkImage(
                  //                 oldMaleModel.imageUrl
                  //             )
                  //         )
                  //     ),
                  //     child: Image.network(oldMaleModel.imageUrl,height: 50,width: 50,)),
                  title: Text(newMaleModel.name,style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gender: ${newMaleModel.gender}'),
                      Text('Father\'s Name: ${newMaleModel.fatherName}'),
                      Text('Father\'s Phone: ${newMaleModel.fatherPhone}'),
                      Text('Religion: ${newMaleModel.religion}'),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }
      return Center(child: Text('There is an error'));
    },
  );
}