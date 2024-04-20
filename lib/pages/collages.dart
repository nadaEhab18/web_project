import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:web_project/models/collage_model.dart';
import 'package:web_project/pages/headBar.dart';
import 'package:web_project/repository/collage_repository.dart';
import 'package:web_project/shared/app_colors.dart';
import 'package:web_project/widgets/sideBar_menu.dart';




class Collages extends StatefulWidget {
  const Collages({Key? key}) : super(key: key);

  @override
  State<Collages> createState() => _CollagesState();
}

class _CollagesState extends State<Collages> {

  TextEditingController collageNameController = TextEditingController();

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
            const  Expanded(child: SideBarMenu(),),



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
                                "بيانات الطلاب الجدد",
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
                              future: CollagesRepository().getCollagesData(),
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
                                            trailing:Row(
                                              mainAxisSize: MainAxisSize.min, // Ensure the Row takes minimum space
                                              children: [
                                                IconButton(
                                                onPressed: () {
                                          showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                          String newName = collageModel.name; // Initialize with current name or provide an input field for the user to enter a new name
                                          return Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: AlertDialog(
                                              backgroundColor: Colors.grey.shade50,
                                            title: Text("تأكيد التحديث",
                                            textDirection: TextDirection.rtl,
                                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                            ),
                                               content : TextFormField(
                                                 decoration: InputDecoration(
                                                   border: OutlineInputBorder(),
                                                   prefixIcon: const Icon(
                                                     Icons.add_business_rounded,
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
                                            actions: [
                                            TextButton(
                                            onPressed: () {
                                            Navigator.of(context).pop(); // Close the dialog
                                            },
                                            child: Text("إلغاء",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                                            ),
                                            TextButton(
                                            onPressed: () {
                                            updateCollege(collageModel.id, newName, context); // Call updateCollege function with the new name
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
                                                            content: Text("هل أنت متأكد من رغبتك في حذف الكلية؟"),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(context).pop(); // Close the dialog
                                                                },
                                                                child: Text("إلغاء",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                                              ),
                                                              TextButton(
                                                                onPressed: () {
                                                                  deleteCollege(collageModel.id, context); // Call deleteCollege function
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
                                            ) ,
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
                    content: TextFormField(
                      controller: collageNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: const Icon(
                          Icons.add_business_rounded,
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey[500]!,
                          ),
                        ),
                        hintText: "اسم الكلية",
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
                        if (value.length > 5) {
                          return 'الرجاء إدخال الاسم كامل';
                        }
                        return null;
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: ()  {
                          String collegeName = collageNameController.text; // Get college name from TextFormField
                          addCollege(collegeName, context);
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


  Future<void> addCollege(String name, BuildContext context) async {
    try {
      Response response = await Dio().post(
        'http://localhost:4000/admin/addcollege',
        data: {
          "name": name,
        },
      );
      if (response.statusCode == 200) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تم إضافة الكلية بنجاح'),
            backgroundColor: Colors.green,
          ),
        );
        // Update colleges data after adding a new college
        CollagesRepository().getCollagesData();
      } else {
        // Show failure message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('فشل في إضافة الكلية'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ أثناء إضافة الكلية'),
          backgroundColor: Colors.red,
        ),
      );
      print('Error occurred while adding college: $error');
    }
  }


  void updateCollege(int collegeId, String newName, BuildContext context) async {
    try {
      Response response = await Dio().put(
        'http://localhost:4000/admin/updatecollege/$collegeId',
        data: {"name": newName},
      );
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تم تحديث الكلية بنجاح'),
            backgroundColor: Colors.green,
          ),
        );
        print('College with ID $collegeId updated successfully');
        // Optionally, perform any additional actions upon successful update
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('فشل في تحديث الكلية'),
            backgroundColor: Colors.red,
          ),
        );
        print('Failed to update college with ID $collegeId');
        // Optionally, handle the failure case
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ أثناء تحديث الكلية'),
          backgroundColor: Colors.red,
        ),
      );
      print('Error occurred while updating college: $error');
      // Optionally, handle the error case
    }
  }


  void deleteCollege(int collegeId, BuildContext context) async {
    try {
      Response response = await Dio().delete('http://localhost:4000/admin/deletecollege/$collegeId');
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تم حذف الكلية بنجاح'),
            backgroundColor: Colors.green,
          ),
        );
        print('College with ID $collegeId deleted successfully');
        // Optionally, perform any additional actions upon successful deletion
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('فشل في حذف الكلية'),
            backgroundColor: Colors.red,
          ),
        );
        print('Failed to delete college with ID $collegeId');
        // Optionally, handle the failure case
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ أثناء حذف الكلية'),
          backgroundColor: Colors.red,
        ),
      );
      print('Error occurred while deleting college: $error');
      // Optionally, handle the error case
    }
  }


}



