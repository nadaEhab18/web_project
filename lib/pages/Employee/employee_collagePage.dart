import 'package:flutter/material.dart';
import 'package:web_project/models/collage_model.dart';
import 'package:web_project/pages/Employee/employee_sideBar_menu.dart';
import 'package:web_project/pages/headBar.dart';
import 'package:web_project/repository/collage_repository.dart';
import 'package:web_project/shared/app_colors.dart';
import 'package:web_project/widgets/sideBar_menu.dart';


class EmployeeCollages extends StatefulWidget {
  const EmployeeCollages({Key? key}) : super(key: key);

  @override
  State<EmployeeCollages> createState() => _EmployeeCollagesState();
}

class _EmployeeCollagesState extends State<EmployeeCollages> {


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
              const  Expanded(child: EmployeeSideBarMenu(),),



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
                          const      HeadBar(),
                          SizedBox(height: 15,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const     Text(
                                "الكليات",
                                style: TextStyle(
                                  color: Color(0xff003c60),
                                  fontSize: 30,
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
                                    const  Icon(Icons.arrow_forward_rounded,color: Colors.white,),
                                  ],)),

                            ],
                          ),
                          Divider(
                            color: AppColors.mainColor,
                            thickness: 0.5,
                          ),
                          SizedBox(height: 15,),

                          /// ##################
                          Expanded(
                            child: FutureBuilder(
                              future: CollagesRepository().getEmployeeCollagesData(),
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
                                      final collageModel = CollagesModel.fromJson(responseList[index]);
                                      return Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Card(
                                          color: Colors.grey.shade50,
                                          margin: EdgeInsets.all(8.0),
                                          child: ListTile(
                                            title: Text(collageModel.name,style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                                            leading:const Icon(Icons.arrow_circle_left_rounded,size: 25,color: Color(0xffac8600),),
                                            // trailing:Row(
                                            //   mainAxisSize: MainAxisSize.min, // Ensure the Row takes minimum space
                                            //   children: [
                                            //     IconButton(
                                            //       onPressed: () {
                                            //         // Handle edit button tap
                                            //       },
                                            //       icon:const Icon(Icons.edit_note_rounded,color: Colors.green,size: 30,),
                                            //     ),
                                            //     IconButton(
                                            //       onPressed: () {
                                            //         // Handle delete button tap
                                            //       },
                                            //       icon:const Icon(Icons.delete_forever_rounded,color: Colors.red,size: 30,),
                                            //     ),
                                            //   ],
                                            // ) ,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                                return Center(child:const Text('There is an error'));
                              },
                            ),
                          )

                          ///*******************

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



