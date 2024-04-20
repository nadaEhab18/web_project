
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';


class HeadBar extends StatefulWidget {
  const HeadBar({Key? key}) : super(key: key);

  @override
  State<HeadBar> createState() => _HeadBarState();
}

class _HeadBarState extends State<HeadBar> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Link(
              target: LinkTarget.blank,
              uri: Uri.parse('https://www.linkedin.com/in/%D8%AC%D8%A7%D9%85%D8%B9%D8%A9-%D8%AD%D9%84%D9%88%D8%A7%D9%86-helwan-uni/'), builder: (context,followLink){
            return InkWell(
              onTap: followLink,
              child:  ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Image.asset('assets/images/linkedin.png', height: 30, width: 30,),
              ),
            );
          }),


          SizedBox(width: 8,),
          Link(
              target: LinkTarget.blank,
              uri: Uri.parse('https://www.instagram.com/helwan_un/'), builder: (context,followLink){
            return InkWell(
              onTap: followLink,
              child:  ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Image.asset('assets/images/instagram (1).png', height: 30, width: 30,),
              ),
            );
          }),


          SizedBox(width: 8,),
          Link(
              target: LinkTarget.blank,
              uri: Uri.parse('https://twitter.com/Helwan_Un?s=09'), builder: (context,followLink){
            return InkWell(
              onTap: followLink,
              child:  ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Image.asset('assets/images/twitter.png', height: 30, width: 30,),
              ),
            );
          }),

          SizedBox(width: 8,),
          Link(
              target: LinkTarget.blank,
              uri: Uri.parse('https://www.facebook.com/helwan.edu.eg1/'), builder: (context,followLink){
            return InkWell(
              onTap: followLink,
              child:  ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Image.asset('assets/images/facebook.png', height: 30, width: 30,),
              ),
            );
          }),


          SizedBox(width: 8,),



        ],
      ),

    );
  }
}
