import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:web_project/models/building_model.dart';
import 'package:web_project/pages/headBar.dart';
import 'package:web_project/repository/buildings_repository.dart';
import 'package:web_project/shared/app_colors.dart';
import 'package:web_project/widgets/sideBar_menu.dart';

class Buildings extends StatefulWidget {
  const Buildings({Key? key}) : super(key: key);

  @override
  State<Buildings> createState() => _BuildingsState();
}

class _BuildingsState extends State<Buildings> {
  List<BuildingsModel> buildingsData = []; // List to store buildings data

  String buildingName(String name){
    if(name == 'Female') name = 'طالبات';
    else{
      name = "طلاب";
    }
    return name ;
  }


  @override
  void initState() {
    super.initState();
    fetchBuildingsData(); // Fetch buildings data when the widget initializes
  }

  Future<void> fetchBuildingsData() async {
    try {
      final response = await BuildingsRepository().getBuildingsData();
      setState(() {
        buildingsData = List<BuildingsModel>.from(
          response.data.map((model) => BuildingsModel.fromJson(model)),
        );
      });
    } catch (e) {
      print('Error fetching buildings data: $e');
      // Handle error fetching data
    }
  }

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
         const     Expanded(
                child: SideBarMenu(),
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
                    const    HeadBar(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          const  Text(
                              "بيانات المبانى بالنظام",
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
                        SizedBox(height: 15,),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: DataTable(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            dataRowColor: MaterialStateProperty.all(Colors.white),
                            columns: const [
                            const  DataColumn(
                                label: Text(
                                  'رقم المبنى', // id
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffac8600),
                                      fontSize: 23,
                                    ),
                                ),
                              ),
                         const     DataColumn(
                                label: Text(
                                  'نوع المبنى',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffac8600),
                                    fontSize: 23,
                                  ),
                                ),
                              ),
                          const    DataColumn(
                                label: Text(
                                  'عدد الغرف',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffac8600),
                                    fontSize: 23,
                                  ),
                                ),
                              ),
                            ],
                            rows: buildingsData.map((building) => DataRow(
                              cells: [
                                DataCell(Text('${building.number}',style: TextStyle(fontSize: 22),)),
                                DataCell(Text('${buildingName(building.gender)}',style: TextStyle(fontSize: 22))),
                                DataCell(Text('${building.numberOfRooms}',style: TextStyle(fontSize: 22))),
                              ],
                            )).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     showDialog(
        //       barrierDismissible: false,
        //       context: context,
        //       builder: (context) {
        //         return AlertDialog(
        //           backgroundColor: Colors.grey.shade50,
        //           content: Directionality(
        //             textDirection: TextDirection.rtl,
        //             child: Column(
        //               children: [
        //                 TextFormField(
        //                   //controller: userNameController,
        //                   decoration: InputDecoration(
        //                     border: OutlineInputBorder(),
        //                     prefixIcon: const Icon(
        //                       Icons.person,
        //                       color: Colors.black,
        //                     ),
        //                     enabledBorder: OutlineInputBorder(
        //                       borderRadius: BorderRadius.circular(10),
        //                       borderSide: BorderSide(
        //                         color: Colors.grey[500]!,
        //                       ),
        //                     ),
        //                     hintText: "الاسم",
        //                     hintStyle: const TextStyle(
        //                       color: Colors.grey,
        //                     ),
        //                     // labelText: "nationalID",
        //                     //labelStyle: const TextStyle(color: Colors.grey),
        //                     contentPadding: const EdgeInsets.all(16),
        //                   ),
        //                   keyboardType: TextInputType.text,
        //                   validator: (value) {
        //                     if (value!.isEmpty) {
        //                       return 'الرجاء إدخال كلمة الاسم';
        //                     }
        //                     if (value.length != 8) {
        //                       return 'الرجاء إدخال الاسم كامل';
        //                     }
        //                     return null;
        //                   },
        //                 ),
        //                 SizedBox(height: 15,),
        //                 TextFormField(
        //                   //controller: userNameController,
        //                   decoration: InputDecoration(
        //                     border: OutlineInputBorder(),
        //                     prefixIcon: const Icon(
        //                       Icons.password,
        //                       color: Colors.black,
        //                     ),
        //                     enabledBorder: OutlineInputBorder(
        //                       borderRadius: BorderRadius.circular(10),
        //                       borderSide: BorderSide(
        //                         color: Colors.grey[500]!,
        //                       ),
        //                     ),
        //                     hintText: "الرقم القومى",
        //                     hintStyle: const TextStyle(
        //                       color: Colors.grey,
        //                     ),
        //                     // labelText: "nationalID",
        //                     //labelStyle: const TextStyle(color: Colors.grey),
        //                     contentPadding: const EdgeInsets.all(16),
        //                   ),
        //                   keyboardType: TextInputType.text,
        //                   validator: (value) {
        //                     if (value!.isEmpty) {
        //                       return 'الرجاء إدخال الرقم القومى';
        //                     }
        //                     if (value.length != 14) {
        //                       return 'الرجاء إدخال الرقم القومى كامل';
        //                     }
        //                     return null;
        //                   },
        //                 ),
        //               ],
        //             ),
        //           ),
        //           actions: [
        //             TextButton(
        //               onPressed: () {},
        //               child: Text(
        //                 'اضافة',
        //                 style: TextStyle(
        //                   color: AppColors.secColor,
        //                 ),
        //               ),
        //             ),
        //             TextButton(
        //               onPressed: () {
        //                 Navigator.of(context).pop();
        //               },
        //               child: Text(
        //                 'الغاء',
        //                 style: TextStyle(
        //                   color:  AppColors.mainColor,
        //                 ),
        //               ),
        //             ),
        //           ],
        //         );
        //       },
        //     );
        //   },
        //   backgroundColor: AppColors.secColor,
        //   child: const Icon(Icons.add),
        // ),
      ),
    );
  }



  // Future<void> deleteBuilding(int buildingId, BuildContext context) async {
  //   try {
  //     Response response = await Dio().delete('http://localhost:4000/employee/deletebuilding/$buildingId');
  //     if (response.statusCode == 200) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('تم حذف المبنى بنجاح'),
  //           backgroundColor: Colors.green,
  //         ),
  //       );
  //       print('Building with ID $buildingId deleted successfully');
  //       // Optionally, perform any additional actions upon successful deletion
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('فشل في حذف المبنى'),
  //           backgroundColor: Colors.red,
  //         ),
  //       );
  //       print('Failed to delete building with ID $buildingId');
  //       // Optionally, handle the failure case
  //     }
  //   } catch (error) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('حدث خطأ أثناء حذف المبنى'),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //     print('Error occurred while deleting building: $error');
  //     // Optionally, handle the error case
  //   }
  // }


}




