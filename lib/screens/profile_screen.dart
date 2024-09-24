
import 'package:flutter/material.dart';

import '../widgets/detail/profile_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
          width: 120,
                height: 120,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                 image: const DecorationImage(
                   image: NetworkImage("https://th.bing.com/th/id/OIP.hmLglIuAaL31MXNFuTGBgAHaHa?rs=1&pid=ImgDetMain"),
                   fit: BoxFit.cover,
                 ),
                  border: Border.all(
                    color: Color(0xFF67C4A7), // Border color
                    width: 4.0,
                ),
              ),),
              SizedBox(height: 10),
              Text("Username", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color (0xFF4F5652)),),
              SizedBox(height: 20),
              ProfileContainer(name: "Username", frontIcon: Icons.person,),
              ProfileContainer(name: "UserEmailEmail@gmail.com", frontIcon: Icons.email_outlined,),
              ProfileContainer(name: "Address", frontIcon: Icons.location_on,),
              ProfileContainer(name: "phone number", frontIcon: Icons.phone,),
           InkWell(onTap: () {

           },

           child:   ProfileContainer(name: "Log Out", frontIcon: Icons.exit_to_app_outlined,),)



            ],
          ),
        ),
      ),
    );
  }
}
