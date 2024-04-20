
import 'package:flutter/material.dart';
import 'package:web_project/models/oldBoys_model.dart';
import 'package:web_project/pages/headBar.dart';
import 'package:web_project/repository/boys_repository.dart';
import 'package:web_project/shared/app_colors.dart';
import 'package:web_project/widgets/sideBar_menu.dart';


class ShowOldBoys extends StatefulWidget {
  const ShowOldBoys({Key? key}) : super(key: key);

  @override
  State<ShowOldBoys> createState() => _ShowOldBoysState();
}

class _ShowOldBoysState extends State<ShowOldBoys> {
  String studentRegion(String region){
    if(region == 'muslim') region = 'مسلم';
    else if (region == 'christian'){
      region='مسيحي';
    }else null ;
    return region;
  }

  String studentType(String gender){
    if(gender == 'Male') gender = 'طالب';
    else if (gender == 'Female'){
      gender='طالبة';
    }else null ;
    return gender;
  }

  String studentCollage(int collageName){
    String collage = '' ;
    if(collageName == 1) collage = 'كلية الهندسة بحلوان';
    if(collageName == 2) collage = 'كلية التجارة';
    if(collageName == 3) collage = 'كلية الهندسة بالمطرية';
    if(collageName == 4) collage = 'كلية الفنون الجميلة';
    if(collageName == 5) collage = 'كلية الحاسبات و المعلومات';
    if(collageName == 6) collage = 'كلية السياحة و الفنادق';
    if(collageName == 7) collage = 'كلية الفنون التطبيقية';
    if(collageName == 8) collage = 'كلية التكنولوجيا و التعليم الصناعى';
    if(collageName == 9) collage = 'كلية الاقتصاد المنزلى';
    if(collageName == 10) collage = 'كلية التربية الفنية';
    if(collageName == 11) collage = 'كلية التربية الموسيقية';
    if(collageName == 12) collage = 'كلية التربية الرياضية (بنين)';
    if(collageName == 13) collage = 'كلية التربية الرياضية (بنات)';
    if(collageName == 14) collage = 'كلية الحقوق';
    if(collageName == 15) collage = 'كلية الاداب';
    if(collageName == 16) collage = 'كلية التربية';
    if(collageName == 17) collage = 'كلية الخدمة الاجتماعية';
    if(collageName == 18) collage = 'كلية الصيدلة';
    if(collageName == 19) collage = 'كلية العلوم';
    if(collageName == 20) collage = 'كلية التمريض';
    if(collageName == 21) collage = 'كلية الطب';
    if(collageName == 22) collage = 'المعهد القومى للملكية الفكرية';
    if(collageName == 23) collage = 'معهد التمريض';
    return collage;
  }

  String studentGovernorate(int governorateId) {
    String governorate = '';
    switch (governorateId) {
      case 1:
        governorate = 'القاهرة';
        break;
      case 2:
        governorate = 'الجيزة';
        break;
      case 3:
        governorate = 'الاسكندرية';
        break;
      case 4:
        governorate = 'الدقهلية';
        break;
      case 5:
        governorate = 'البحر الاحمر';
        break;
      case 6:
        governorate = 'البحيرة';
        break;
      case 7:
        governorate = 'الفيوم';
        break;
      case 8:
        governorate = 'الغربية';
        break;
      case 9:
        governorate = 'الاسماعلية';
        break;
      case 10:
        governorate = 'المنوفية';
        break;
      case 11:
        governorate = 'المنيا';
        break;
      case 12:
        governorate = 'القليوبية';
        break;
      case 13:
        governorate = 'الوادى الجديد';
        break;
      case 14:
        governorate = 'السويس';
        break;
      case 15:
        governorate = 'اسوان';
        break;
      case 16:
        governorate = 'اسيوط';
        break;
      case 17:
        governorate = 'بنى سويف';
        break;
      case 18:
        governorate = 'بورسعيد';
        break;
      case 19:
        governorate = 'دمياط';
        break;
      case 20:
        governorate = 'الشرقية';
        break;
      case 21:
        governorate = 'جنوب سيناء';
        break;
      case 22:
        governorate = 'كفرالشيخ';
        break;
      case 23:
        governorate = 'مطروح';
        break;
      case 24:
        governorate = 'الاقصر';
        break;
      case 25:
        governorate = 'قنا';
        break;
      case 26:
        governorate = 'شمال سيناء';
        break;
      case 27:
        governorate = 'سوهاج';
        break;
      default:
        governorate = 'غير معروف';
    }
    return governorate;
  }

  String studentScore(int scoreId) {
    String scoreName = '';
    switch (scoreId) {
      case 1:
        scoreName = 'مقبول';
        break;
      case 2:
        scoreName = 'محمل بمواد';
        break;
      case 3:
        scoreName = 'غياب بعذر';
        break;
      case 4:
        scoreName = 'منقول بمادة و مادة ثانوية';
        break;
      case 5:
        scoreName = 'ناجح';
        break;
      case 6:
        scoreName = 'جيد';
        break;
      case 7:
        scoreName = 'جيد جدا';
        break;
      case 8:
        scoreName = 'ممتاز';
        break;
      case 9:
        scoreName = 'منقول بمادتين و مادة فرعية';
        break;
      case 10:
        scoreName = 'راسب';
        break;
      case 11:
        scoreName = 'دور تانى';
        break;
      case 12:
        scoreName = 'منقطع';
        break;
      default:
        scoreName = 'غير معروف';
    }
    return scoreName;
  }

  String studentLevel(int LevelId) {
    String levelName = '';
    switch (LevelId) {
      case 1:
        levelName = 'اعدادى';
        break;
      case 2:
        levelName = 'الاولى';
        break;
      case 3:
        levelName = 'الثانية';
        break;
      case 4:
        levelName = 'الثالثة';
        break;
      case 5:
        levelName = 'الرابعة';
        break;
      case 6:
        levelName = 'الخامسة';
        break;
      case 8:
        levelName = 'دراسات عليا';
        break;
      default:
        levelName = 'غير معروف';
    }
    return levelName;
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
         const     Expanded(child: SideBarMenu(),),



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
                     const     HeadBar(),
                          SizedBox(height: 15,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            const  Text(
                                "بيانات الطلاب القدامى",
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
                            const    Text('الرجوع  ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                            const    Icon(Icons.arrow_forward_rounded,color: Colors.white,),
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
                                                Text('${oldMaleModel.fatherName}'),
                                                Text('الكلية : ${studentCollage(oldMaleModel.collegeId)}'),
                                                Text('الفرقة : ${studentLevel(oldMaleModel.levelId)}'),
                                                Text('النقدير : ${studentScore(oldMaleModel.gpaId)}'),
                                                Text('المحافظة : ${studentGovernorate(oldMaleModel.governorateId)}'),
                                                Text('النوع :${studentType(oldMaleModel.gender)}'),
                                                Text('الديانة : ${studentRegion(oldMaleModel.religion)}'),
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
                            ),
                          )


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


