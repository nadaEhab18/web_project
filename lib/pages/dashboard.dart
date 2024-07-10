import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:web_project/pages/headBar.dart';
import 'package:web_project/shared/app_colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          const HeadBar(),
  Container(
    height: MediaQuery.of(context).size.height * 0.13,
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('مرحبا بك ...',style: TextStyle(
          color: AppColors.mainColor,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),),
        Text('فى مدينة حلوان الجامعية',style: TextStyle(
          color: AppColors.secColor,
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),),


      ],
    ),

  ),
          SizedBox(height: 4.4,),
          Container(
    color: AppColors.mainColor,
    height: MediaQuery.of(context).size.height * 0.78,
    width: MediaQuery.of(context).size.width,
    child: CarouselSlider.builder(
      itemCount: 5,
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        enableInfiniteScroll: true,
        viewportFraction: 1.0, // Ensure each image occupies the entire width

      ),
      itemBuilder: (BuildContext context, int itemIndex,
          int pageViewIndex) {
        return ClipRRect(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/$itemIndex.jpeg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        );
      },
    ),
  ),

        ],
      ),
    );
  }
}
