
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 20),

      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: Image.asset('assets/images/profile.png',height: 60,width: 60,),
                ),
                SizedBox(width: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text('رمضان شئون',style: TextStyle(fontWeight: FontWeight.bold),),
                    Text('عامل بالنظام ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey))
                    ,
                  ],
                ),

              ],
            ),
          ),
          Divider(
            thickness: 2,
            color: Colors.grey,
          ),
          Directionality(
              textDirection: TextDirection.rtl,
              child: Icon(Icons.logout_outlined,color: Colors.grey,)),
        ],
      ),
    );
  }
}
