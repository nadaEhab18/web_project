import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:web_project/models/building_model.dart';
import 'package:web_project/pages/Employee/employee_sideBar_menu.dart';
import 'package:web_project/pages/headBar.dart';
import 'package:web_project/repository/buildings_repository.dart';
import 'package:web_project/shared/app_colors.dart';
import 'package:web_project/widgets/sideBar_menu.dart';

class EmployeeBuildings extends StatefulWidget {
  const EmployeeBuildings({Key? key}) : super(key: key);

  @override
  State<EmployeeBuildings> createState() => _EmployeeBuildingsState();
}

class _EmployeeBuildingsState extends State<EmployeeBuildings> {
  List<BuildingsModel> buildingsData = [];// List to store buildings data
  String? dropValue;


  String buildingName(String name){
    if(name == 'Female') name = 'طالبات';
    else{
      name = "طلاب";
    }
    return name ;
  }

  TextEditingController buildingNumberController = TextEditingController();
  TextEditingController buildingGenderController = TextEditingController();
  TextEditingController buildingRoomsController = TextEditingController();
  TextEditingController buildingFloorController = TextEditingController();


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
                child: EmployeeSideBarMenu(),
              ),

              /// body
              Expanded(
                flex: 4,
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
                  child:
                  SingleChildScrollView(
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
                          child: SingleChildScrollView(
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
                        const      DataColumn(
                                  label: Text(
                                    ' ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffac8600),
                                    ),
                                  ),
                                ), // CRUD operations
                              ],
                              rows: buildingsData.map((building) => DataRow(
                                cells: [
                                  DataCell(Text('${building.number}',style: TextStyle(fontSize: 22),)),
                                  DataCell(Text('${buildingName(building.gender)}',style: TextStyle(fontSize: 22))),
                                  DataCell(Text('${building.numberOfRooms}',style: TextStyle(fontSize: 22))),
                                  DataCell(
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                String newNumber = building.number.toString();
                                                String newGender = building.gender;
                                                                 //buildingName(building.gender); // Initialize with current name or provide an input field for the user to enter a new name
                                                String newRooms = building.numberOfRooms.toString();
                                                String newFloors = building.numberOfFloors.toString(); // Initialize with current name or provide an input field for the user to enter a new name

                                                return Directionality(
                                                  textDirection: TextDirection.rtl,
                                                  child: AlertDialog(
                                                    backgroundColor: Colors.grey.shade50,
                                                    title: Text("تأكيد التحديث",
                                                      textDirection: TextDirection.rtl,
                                                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                                    ),
                                                    content : Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        TextFormField(
                                                          decoration: InputDecoration(
                                                            label:const Text('رقم المبنى :',style: TextStyle(color: Colors.grey),),
                                                            border: OutlineInputBorder(),
                                                            prefixIcon: const Icon(
                                                              Icons.home_work_outlined,
                                                              color: Colors.black,
                                                            ),
                                                            enabledBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                              borderSide: BorderSide(
                                                                color: Colors.grey[500]!,
                                                              ),
                                                            ),
                                                            contentPadding: const EdgeInsets.all(16),
                                                          ),

                                                          initialValue: newNumber,
                                                          onChanged: (value) {
                                                            newNumber = value; // Update newName as the user types
                                                          },

                                                        ),
                                                        SizedBox(height: 15,),

                                                        Container(
                                                          child: DropdownButtonFormField<String>(
                                                            dropdownColor: Colors.white,
                                                            decoration: InputDecoration(
                                                              label:const Text('نوع المبنى :',style: TextStyle(color: Colors.grey),),
                                                              prefixIcon:const Icon(Icons.how_to_reg,color: Colors.black,),
                                                              border: InputBorder.none,
                                                              enabledBorder: OutlineInputBorder(
                                                               borderRadius: BorderRadius.circular(10),
                                                                borderSide: BorderSide(
                                                                  color: Colors.grey[500]!,
                                                                ),
                                                              ),
                                                            ),
                                                            value: newGender,
                                                            items: <DropdownMenuItem<String>>[
                                                              DropdownMenuItem<String>(
                                                                child: Directionality(
                                                                    textDirection: TextDirection.rtl,
                                                                    child: Text('طلاب',style: TextStyle(color: Colors.black, ),)),
                                                                value: 'Male', // Set value to 'Male'
                                                              ),
                                                              DropdownMenuItem<String>(
                                                                child: Directionality(
                                                                    textDirection: TextDirection.rtl,
                                                                    child: Text('طالبات',style: TextStyle(color: Colors.black,),)),
                                                                value: 'Female', // Set value to 'Female'
                                                              ),
                                                            ],
                                                            onChanged: (String? newValue) {
                                                              setState(() {
                                                                newGender = newValue!;
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(height: 15,),

                                                        TextFormField(
                                                          decoration: InputDecoration(
                                                            label:const Text('عدد الغرف :',style: TextStyle(color: Colors.grey),),
                                                            border: OutlineInputBorder(),
                                                            prefixIcon: const Icon(
                                                              Icons.calendar_view_month_rounded,
                                                              color: Colors.black,
                                                            ),
                                                            enabledBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                              borderSide: BorderSide(
                                                                color: Colors.grey[500]!,
                                                              ),
                                                            ),
                                                            contentPadding: const EdgeInsets.all(16),
                                                          ),

                                                          initialValue: newRooms,
                                                          onChanged: (value) {
                                                            newRooms = value; // Update newName as the user types
                                                          },

                                                        ),
                                                        SizedBox(height: 15,),

                                                        TextFormField(
                                                          decoration: InputDecoration(
                                                            label:const Text('عدد الطوابق :',style: TextStyle(color: Colors.grey),),
                                                            border: OutlineInputBorder(),
                                                            prefixIcon: const Icon(
                                                              Icons.receipt_outlined,
                                                              color: Colors.black,
                                                            ),
                                                            enabledBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(10),
                                                              borderSide: BorderSide(
                                                                color: Colors.grey[500]!,
                                                              ),
                                                            ),
                                                            contentPadding: const EdgeInsets.all(16),
                                                          ),

                                                          initialValue: newFloors,
                                                          onChanged: (value) {
                                                            newFloors = value; // Update newName as the user types
                                                          },

                                                        ),





                                                      ],
                                                    )
                                                    ,
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop(); // Close the dialog
                                                        },
                                                        child: Text("إلغاء",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          updateBuilding(building.id, newNumber,newGender,newRooms,newFloors, context); // Call updateCollege function with the new name
                                                          Navigator.of(context).pop(); // Close the dialog
                                                        },
                                                        child: Text("تحديث",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          icon:const Icon(Icons.edit_note_rounded,color: Colors.green,size: 30,),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Directionality(
                                                  textDirection: TextDirection.rtl,
                                                  child: AlertDialog(
                                                    backgroundColor: Colors.grey.shade50,
                                                    title: Text("تأكيد الحذف",textDirection: TextDirection.rtl,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                                                    content: Text("هل أنت متأكد من رغبتك في حذف المبنى؟"),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop(); // Close the dialog
                                                        },
                                                        child: Text("إلغاء",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          deleteBuilding(building.id, context); // Call deleteCollege function
                                                          Navigator.of(context).pop(); // Close the dialog
                                                        },
                                                        child: Text("حذف",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          icon: const Icon(Icons.delete_forever_rounded, color: Colors.red, size: 30),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )).toList(),
                            ),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: AlertDialog(
                    backgroundColor: Colors.grey.shade50,
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: buildingNumberController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: const Icon(
                              Icons.home_work_outlined,
                              color: Colors.black,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey[500]!,
                              ),
                            ),
                            hintText: "رقم المبنى",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            contentPadding: const EdgeInsets.all(16),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الرجاء إدخال رقم المبنى';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15,),

                        Container(
                          margin: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.5,
                              color: Colors.grey.shade400,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButtonFormField(
                            dropdownColor: Colors.white,
                            decoration: InputDecoration(
                              label:const Text('نوع المبنى :',style: TextStyle(color: Colors.grey),),
                              prefixIcon:const Icon(Icons.how_to_reg,color: Colors.black,),
                              border: InputBorder.none,
                            ),
                            onChanged: (val) {
                              setState(() {
                                dropValue = val as String;
                                print('gender : $dropValue');
                              });
                            },
                            validator: (value) {
                              if (value == null || (value as String).isEmpty) {
                                return 'الرجاء اختيار نوع المبنى';
                              }
                              return null;
                            },
                            value: dropValue,
                            items: <DropdownMenuItem<String>>[
                              DropdownMenuItem<String>(
                                child: Text('طلاب',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                value: 'Male',
                              ),
                              DropdownMenuItem<String>(
                                child: Text('طالبات',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                value: 'Female',
                              ),
                            ],
                          ),
                        ),


                        SizedBox(height: 15,),
                        TextFormField(
                          controller: buildingRoomsController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey[500]!,
                              ),

                            ),
                            prefixIcon: const Icon(
                              Icons.calendar_view_month_rounded,
                              color: Colors.black,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey[500]!,
                              ),
                            ),
                            hintText: "عدد الغرف",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            contentPadding: const EdgeInsets.all(16),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الرجاء إدخال عدد الغرف';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 25,),
                        TextFormField(
                          controller: buildingFloorController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: const Icon(
                              Icons.receipt_outlined,
                              color: Colors.black,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey[500]!,
                              ),
                            ),
                            hintText: "عدد الطوابق",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            contentPadding: const EdgeInsets.all(16),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الرجاء إدخال عدد الطوابق';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: ()  {
                          String buildingNumber = buildingNumberController.text;
                          String buildingGender =  dropValue!;
                                             //   buildingGenderController.text; // Get college name from TextFormField
                          String buildingRooms = buildingRoomsController.text;
                          String buildingFloor = buildingFloorController.text; // Get college name from TextFormField
                          addBuilding(buildingNumber,buildingGender,buildingRooms,buildingFloor, context);
                          Navigator.of(context).pop();                      },
                        child: Text(
                          'اضافة',
                          style: TextStyle(
                              color: AppColors.secColor,
                              fontWeight: FontWeight.bold

                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'الغاء',
                          style: TextStyle(
                              color:  AppColors.mainColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          backgroundColor: AppColors.secColor,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }





  Future<void> addBuilding(String number,String gender,String number_of_rooms,String floors, BuildContext context) async {
    try {
      Response response = await Dio().post(
        'http://localhost:4000/employee/addbuilding',
        data: {
          "number":number,
          "gender":gender,
          "number_of_rooms":number_of_rooms,
          "number_of_floors":floors
        },
      );
      if (response.statusCode == 200) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تم إضافة المبنى بنجاح',style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22
            ),),
            backgroundColor: Colors.green,
          ),
        );
        // Update colleges data after adding a new college
        BuildingsRepository().getBuildingsData();
      } else {
        // Show failure message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('فشل في إضافة المبنى',style: TextStyle(
                color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22
            ),),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ أثناء إضافة المبنى',style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22
          ),),
          backgroundColor: Colors.red,
        ),
      );
      print('Error occurred while adding building: $error');
    }
  }

  void updateBuilding(int buildingId, String newNumber, String newGender,String newRooms,String newFloors, BuildContext context) async {
    try {
      Response response = await Dio().put(
        'http://localhost:4000/employee/updatebuilding/$buildingId',
        data: {
          "number":newNumber,
          "gender":newGender,
          "number_of_rooms":newRooms,
          "number_of_floors":newFloors
        },
      );
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تم تحديث المبنى بنجاح',style: TextStyle(
                color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22
            ),),
            backgroundColor: Colors.green,
          ),
        );
        print('Building with ID $buildingId updated successfully');
        // Optionally, perform any additional actions upon successful update
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('فشل في تحديث المبنى',style: TextStyle(
                color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22
            ),),
            backgroundColor: Colors.red,
          ),
        );
        print('Failed to update Building with ID $buildingId');
        // Optionally, handle the failure case
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ أثناء تحديث المبنى',style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22
          ),),
          backgroundColor: Colors.red,
        ),
      );
      print('Error occurred while updating Building: $error');
      // Optionally, handle the error case
    }
  }


  void deleteBuilding(int buildingId, BuildContext context) async {
    try {
      Response response = await Dio().delete('http://localhost:4000/employee/deletebuilding/$buildingId');
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تم حذف المبنى بنجاح',style: TextStyle(
                color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22
            ),),
            backgroundColor: Colors.green,
          ),
        );
        print('Building with ID $buildingId deleted successfully');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('فشل في حذف المبنى',style: TextStyle(
                color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22
            ),),
            backgroundColor: Colors.red,
          ),
        );
        print('Failed to delete building with ID $buildingId');
        // Optionally, handle the failure case
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ أثناء حذف المبنى',style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22
          ),),
          backgroundColor: Colors.red,
        ),
      );
      print('Error occurred while deleting building: $error');
      // Optionally, handle the error case
    }
  }



}

