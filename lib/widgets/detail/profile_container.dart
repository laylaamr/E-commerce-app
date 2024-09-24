import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class ProfileContainer extends StatelessWidget {
 ProfileContainer({super.key, required this.name, required this.frontIcon });
String name;

 final IconData frontIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      width: double.infinity,
      height: 60 ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFF7FFFB),
      ),
      child: Row(
        children: [
       Icon(frontIcon , size: 25,color: Color (0xFF4F5652)),
          const SizedBox(width: 10,),
          Text(name, style: TextStyle(fontSize: 16,color: Color (0xFF4F5652) ),),



        ],
      ),
    );
  }
}
