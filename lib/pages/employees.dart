import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:web_project/models/building_model.dart';
import 'package:web_project/models/employees_model.dart';
import 'package:web_project/pages/headBar.dart';
import 'package:web_project/repository/buildings_repository.dart';
import 'package:web_project/repository/employees_repository.dart';
import 'package:web_project/shared/app_colors.dart';
import 'package:web_project/widgets/sideBar_menu.dart';

class Employees extends StatefulWidget {
  const Employees({Key? key}) : super(key: key);

  @override
  State<Employees> createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  List<EmployeesModel> employeesData = [];

  @override
  void initState() {
    super.initState();
    fetchEmployeesData();
  }

  Future<void> fetchEmployeesData() async {
    try {
      final response = await EmployeesRepository().getEmployeesData();
      setState(() {
        employeesData = List<EmployeesModel>.from(
          response.data.map((model) => EmployeesModel.fromJson(model)),
        );
      });
    } catch (e) {
      print('Error fetching buildings data: $e');
      // Handle error fetching data
    }
  }

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController national_IDController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isObscureText = true;



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
              const Expanded(
                child: SideBarMenu(),
              ),

              /// body
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
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
                          HeadBar(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "بيانات العاملين بالنظام",
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
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: DataTable(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              dataRowColor: MaterialStateProperty.all(
                                  Colors.white),
                              columns: const [
                                const DataColumn(
                                  label: Text(
                                    'الاسم', // id
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffac8600),
                                      fontSize: 23,
                                    ),
                                  ),
                                ),
                                const DataColumn(
                                  label: Text(
                                    'الرقم القومى',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffac8600),
                                      fontSize: 23,
                                    ),
                                  ),
                                ),
                                const DataColumn(
                                  label: Text(
                                    ' ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffac8600),
                                    ),
                                  ),
                                ), // CRUD operations
                              ],
                              rows: employeesData.map((employee) =>
                                  DataRow(
                                    cells: [
                                      DataCell(Text('${employee.name}',
                                        style: TextStyle(fontSize: 22),)),
                                      DataCell(Text('${employee.nationalId}',
                                          style: TextStyle(fontSize: 22))),
                                      DataCell(
                                        Row(
                                          children: [
                                            IconButton(
                                            onPressed: () {
                                      showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                      String newName = employee.name; // Initialize with current name
                                      String newNationalId = employee.nationalId; // Initialize with current admin ID or provide an input field for the user to select a new admin ID
                                      return Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: AlertDialog(
                                      backgroundColor: Colors.grey.shade50,
                                      title: Text(
                                      "تحديث الموظف",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                      ),
                                      content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                      TextFormField(
                                      decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      prefixIcon: const Icon(
                                      Icons.person,
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
                                      initialValue: newName,
                                      onChanged: (value) {
                                        newName = value; // Update newName as the user types
                                      },
                                      ),
                                      SizedBox(height: 10),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            prefixIcon: const Icon(
                                              Icons.quick_contacts_mail,
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
                                          initialValue: newNationalId,
                                          onChanged: (value) {
                                            newNationalId = value; // Update newName as the user types
                                          },
                                        ),
                                      ],
                                      ),
                                      actions: [
                                      TextButton(
                                      onPressed: () {
                                      Navigator.of(context).pop(); // Close the dialog
                                      },
                                      child: Text(
                                      "إلغاء",
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                      ),
                                      ),
                                      TextButton(
                                      onPressed: () {
                                      updateEmployee(employee.id, newName, newNationalId, context); // Call updateEmployee function with the new information
                                      Navigator.of(context).pop(); // Close the dialog
                                      },
                                      child: Text(
                                      "تحديث",
                                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                                      ),
                                      ),
                                      ],
                                      ),
                                      );
                                      },
                                      );
                                      },
                                        icon: Icon(Icons.edit_note_rounded, color: Colors.green, size: 30),
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
                                                        title: Text("تأكيد الحذف",style: TextStyle(color: Colors.red),),
                                                        content: Text("هل أنت متأكد من رغبتك في الحذف ؟"),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.of(context).pop(); // Close the dialog
                                                            },
                                                            child: Text("إلغاء",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              deleteEmployee(employee.id,context);
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
                                              icon: const Icon(Icons.delete,
                                                  color: Colors.red),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )).toList(),
                            ),
                          ),
                        ],
                      ),
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
                    content:
                     // textDirection: TextDirection.rtl,
                      Column(
                        children: [
                          TextFormField(
                            controller: userNameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey[500]!,
                                ),
                              ),
                              hintText: "الاسم",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              contentPadding: const EdgeInsets.all(16),
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'الرجاء إدخال كلمة الاسم';
                              }
                              // if (value.length != 8) {
                              //   return 'الرجاء إدخال الاسم كامل';
                              // }
                              return null;
                            },
                          ),
                          SizedBox(height: 15,),
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: const Icon(
                                  Icons.password,
                                  color: Colors.black),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscureText = !isObscureText;
                                  },);
                                },

                                icon: isObscureText
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey[500]!,
                                ),
                              ),
                              hintText: "كلمة المرور",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              contentPadding: const EdgeInsets.all(16),
                            ),
                            obscureText: isObscureText,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'الرجاء إدخال كلمة المرور';
                              }
                              if (value.length < 5 || value.length >9) {
                                return 'الرجاء إدخال كلمة المرور كاملة';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15,),
                          TextFormField(
                            controller: national_IDController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: const Icon(
                                Icons.quick_contacts_mail,
                                color: Colors.black,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey[500]!,
                                ),
                              ),
                              hintText: "الرقم القومى",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              contentPadding: const EdgeInsets.all(16),
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'الرجاء إدخال الرقم القومى';
                              }
                              if (value.length != 14) {
                                return 'الرجاء إدخال الرقم القومى كامل';
                              }
                              return null;
                            },
                          ),
                        ],
                      )
                    ,
                    actions: [
                      TextButton(
                          onPressed: ()  {
                    String name = userNameController.text;
                    String password = passwordController.text;
                    String national_ID = national_IDController.text;
                     addEmployee(name, password, national_ID, context);
                    Navigator.pop(context);
                  },

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
                            color: AppColors.mainColor,
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

  Future<void> addEmployee(String name, String password, String national_ID, BuildContext context) async {
    try {
      Response response = await Dio().post(
        'http://localhost:4000/admin/addemployee',
        data:
        {
        "name":name,
        "password":password,
        "national_ID":national_ID
        }

        ,
      );
      if (response.statusCode == 200) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تم إضافة الموظف بنجاح',
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
            backgroundColor: Colors.green,
          ),
        );
           EmployeesRepository().getEmployeesData();
      } else {
        // Show failure message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('فشل في إضافة الموظف'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ أثناء إضافة الموظف , الموظف موجود بالفعل',style: TextStyle(
            fontSize: 25,fontWeight: FontWeight.bold,
          ),),
          backgroundColor: Colors.red,
        ),
      );
      print('Error occurred while adding employee: $error');
    }
  }


  void updateEmployee(int employeeId, String newName, String newNationalId, BuildContext context) async {
    try {
      Response response = await Dio().put(
        'http://localhost:4000/admin/updateemployee/$employeeId',
        data: {
          "name": newName,
          "national_ID":newNationalId
        },
      );
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تم تحديث الموظف بنجاح',style: TextStyle(
              fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white,
            ),),
            backgroundColor: Colors.green,
          ),
        );
        print('Employee with ID $employeeId updated successfully');
        // Optionally, perform any additional actions upon successful update
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('فشل في تحديث الموظف',style: TextStyle(
              fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white,
            ),),
            backgroundColor: Colors.red,
          ),
        );
        print('Failed to update employee with ID $employeeId');
        // Optionally, handle the failure case
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ أثناء تحديث الموظف',style: TextStyle(
            fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white,
          ),),
          backgroundColor: Colors.red,
        ),
      );
      print('Error occurred while updating employee: $error');
      // Optionally, handle the error case
    }
  }

  void deleteEmployee(int employeeId, BuildContext context) async {
    try {
      Response response = await Dio().delete(
          'http://localhost:4000/admin/deleteemployee/$employeeId');
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تم حذف الموظف بنجاح',style: TextStyle(
              fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white,
            ),),
            backgroundColor: Colors.green,
          ),
        );
        print('Employee with ID $employeeId deleted successfully');
        // Optionally, perform any additional actions upon successful deletion
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('فشل في حذف الموظف',style: TextStyle(
              fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white,
            ),),
            backgroundColor: Colors.red,
          ),
        );
        print('Failed to delete employee with ID $employeeId');
        // Optionally, handle the failure case
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ أثناء حذف الموظف',style: TextStyle(
            fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white,
          ),),
          backgroundColor: Colors.red,
        ),
      );
      print('Error occurred while deleting employee: $error');
      // Optionally, handle the error case
    }
  }




}