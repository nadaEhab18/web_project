
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:web_project/pages/Employee/employee_homePage.dart';
import 'package:web_project/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController adminIDController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isObscureText = true;




  @override
  Widget build(BuildContext context) {
    const Color secondaryColor =  Color(0xffac8600);

    return Scaffold(
      body:Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xff003c60),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.60,
            height: MediaQuery.of(context).size.height * 0.85,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),

    child: isLoading
    ? Center(child: CircularProgressIndicator(),

    )
        :
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/helwanLogo.png',
                    height: 150,
                    width: 150,
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  /// اسم المستخدم
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      width: 350,
                      child: TextFormField(
                        controller: userNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder:
                          OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey[500]!),
                          ),
                          hintText: "اسم المستخدم",
                          hintStyle: const TextStyle(
                              color: Colors.grey),
                          contentPadding:
                          const EdgeInsets.all(16),
                          prefixIcon:
                          Icon(Icons.co_present,color: Colors.black),
                        ),
                        keyboardType:
                        TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الرجاء إدخال اسم المستخدم';
                          }
                          // if (value.length != 14) {
                          //   return 'الرجاء إدخال الرقم القومي كامل';
                          // }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),


                  /// admin id
                  // Directionality(
                  //   textDirection: TextDirection.rtl,
                  //   child: Container(
                  //     width: 350,
                  //     child: TextFormField(
                  //       controller: adminIDController,
                  //       decoration: InputDecoration(
                  //         border: OutlineInputBorder(),
                  //         enabledBorder:
                  //         OutlineInputBorder(
                  //           borderRadius:
                  //           BorderRadius.circular(10),
                  //           borderSide: BorderSide(
                  //               color: Colors.grey[500]!),
                  //         ),
                  //         hintText: "رقم المستخدم",
                  //         hintStyle: const TextStyle(
                  //             color: Colors.grey),
                  //         contentPadding:
                  //         const EdgeInsets.all(16),
                  //         prefixIcon:
                  //         Icon(Icons.co_present,color: Colors.black),
                  //       ),
                  //       keyboardType:
                  //       TextInputType.text,
                  //       validator: (value) {
                  //         if (value!.isEmpty) {
                  //           return 'الرجاء إدخال اسم المستخدم';
                  //         }
                  //         // if (value.length != 14) {
                  //         //   return 'الرجاء إدخال الرقم القومي كامل';
                  //         // }
                  //         return null;
                  //       },
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),


                  ///كلمة المرور
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                        width: 350,
                        child: TextFormField(
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
                            enabledBorder:
                            OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.grey[500]!),
                            ),
                            hintText: "كلمة المرور",
                            hintStyle: const TextStyle(
                                color: Colors.grey),
                            contentPadding:
                            const EdgeInsets.all(16),
                          ),
                          obscureText: isObscureText,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الرجاء إدخال كلمة المرور';
                            }
                            // if (value.length != 14) {
                            //   return 'الرجاء إدخال الرقم القومي كامل';
                            // }
                            return null;
                          },
                          onTap: () {},
                        )),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  /// button تسجيل الدخول
                  // Container(
                  //   width: 280,
                  //   height: 40,
                  //   child:
                  //   ElevatedButton(
                  //       onPressed: () {
                  //
                  //         Navigator.of(context).push(
                  //             MaterialPageRoute(
                  //                 builder: (BuildContext context) {
                  //                   return HomePage();
                  //                 }
                  //             ) );
                  //
                  //         },
                  //       style: ButtonStyle(
                  //         backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                  //               (Set<MaterialState> states) {
                  //             return secondaryColor; // Set your desired color here
                  //           },
                  //         ),
                  //       ),
                  //       child: const Text(
                  //         "تسجيل الدخول",
                  //         style: TextStyle(
                  //           fontSize: 20,
                  //           color: Colors.white,
                  //         ),
                  //       )),
                  // ),

                  /// Admin login
                  SizedBox(
                    height: 50,
                    width: 280,
                    //  width: 350,
                    child:
                    ElevatedButton(
                      child: Text('تسجيل الدخول الادمن',style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),),
                      onPressed:_adminLoginMethod,
                      style: ElevatedButton.styleFrom(
                        primary:passwordController.text.isEmpty
                            ? Colors.grey: Color(0xffac8600),
                        // shadowColor: Color(0xff40BFFF).withOpacity(0.24),
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),

                  /// Employee login
    //               SizedBox(
    //                 height: 50,
    //                  width: 280,
    //                 child:  ElevatedButton(
    //                   child: Text('تسجيل الدخول الموظف',style: TextStyle(
    //                     fontSize: 20,
    //                     color: Colors.white,
    //                   ),),
    //                   onPressed: _employeeLoginMethod,
    //                   style: ElevatedButton.styleFrom(
    //                  primary: passwordController.text.isEmpty
    //                                           ? Colors.grey: Color(0xffac8600),
    // // shadowColor: Color(0xff40BFFF).withOpacity(0.24),
    //                   ),
    //                 ),
    //               ),


                ],
              ),
            ),
          ),
        ],
      ),

    );

  }


  // void _adminLoginMethod() async {
  //   bool isFormValid = formKey.currentState!.validate();
  //   if (isFormValid) {
  //     setState(() => isLoading = true);
  //     final Response response = await Dio().post(
  //         'http://localhost:4000/admin/login',
  //         data: {
  //           "name": userNameController.text,
  //           "password": passwordController.text,
  //         }
  //     );
  //
  //     // debugging
  //     print('this is a response : $response');
  //
  //     setState(() => isLoading = false);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('تم تسجيل الدخول بنجاح'),
  //         backgroundColor: isLoading == false ? Colors.green : Colors.red,
  //       ),
  //     );
  //       Navigator.of(context).push(
  //         MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return HomePage();
  //           },
  //         ),
  //         // (route) => false,
  //       );
  //     //}
  //   }
  // }

  void _adminLoginMethod() async {
    bool isFormValid = formKey.currentState!.validate();
    if (isFormValid) {
      setState(() => isLoading = true);
      try {
        final Response response = await Dio().post(
          'http://localhost:4000/admin/login',
          data: {
            "name": userNameController.text,
            "password": passwordController.text
          },
        );

        // debugging
        print('this is a response : $response');

        setState(() => isLoading = false);
        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('تم تسجيل الدخول بنجاح'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return HomePage();
              },
            ),
          );
        } else if (response.statusCode == 404) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.statusMessage.toString(),
                 // 'اسم المستخدم غير صحيح'
              ),
              backgroundColor: Colors.red,
            ),
          );
        } else if (response.statusCode == 400) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.data['errors']['msg']
                 // 'كلمة المرور غير صحيحة'
              ),
              backgroundColor: Colors.red,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('حدث خطأ أثناء تسجيل الدخول', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (error) {
        setState(() => isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('حدث خطأ أثناء تسجيل الدخول'),
            backgroundColor: Colors.red,
          ),
        );
        print('Error occurred: $error');
      }
    }
  }



  void _employeeLoginMethod() async {
    bool isFormValid = formKey.currentState!.validate();
    if (isFormValid) {
      setState(() => isLoading = true);
      final Response response = await Dio().post(
          'http://localhost:4000/employee/login',
          data: {
            "name": userNameController.text,
            "password": passwordController.text,
           // "admin_id": adminIDController.text,

          }
      );

      // debugging
      print('this is a response : $response');

      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('تم تسجيل الدخول بنجاح'),
          backgroundColor: isLoading == false ? Colors.green : Colors.red,
        ),
      );
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return EmployeeHomePage();
          },
        ),
        // (route) => false,
      );
      //}
    }
  }


}


