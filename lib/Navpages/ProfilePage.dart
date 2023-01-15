
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';


import '../imagestrings.dart';
import '../textstrings.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark=MediaQuery.of(context).platformBrightness==Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){}, icon: const Icon(LineAwesomeIcons.angle_left),color: Colors.black,),
        title: Text(tProfile, textAlign: TextAlign.center, style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(isDark? LineAwesomeIcons.sun:LineAwesomeIcons.moon),color: Colors.black,),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Container(
                width: 150,height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100), child: Image(image: AssetImage(tProfileImage),),
                ),
              ),
              const SizedBox(height: 10),
              Text(tProfileHeading,style: Theme.of(context).textTheme.headline4,),
              Text(tProfileSubHeading,style: Theme.of(context).textTheme.bodyText2,),
              const SizedBox(height: 20,),
              SizedBox(
                width:200,
                child: ElevatedButton(onPressed: (){},
                  child: const Text(tEditProfile,style: TextStyle(color: Colors.black,fontSize: 20,),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(
              ),
              const SizedBox(height: 10,),

              ListTile(
                contentPadding: EdgeInsets.only(left: 40,right: 30),
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color:Colors.lightBlue.withOpacity(0.1),
                  ),
                  child: const Icon(LineAwesomeIcons.user_check,size:18.0,color: Colors.blue, ),
                ),
                title: Text("User Details",
                  style: TextStyle(
                    fontSize: 20,

                  ),),
                trailing: Container(
                  width:40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: const Icon(LineAwesomeIcons.angle_right,size: 18.0,color: Colors.grey,
                  ),


                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 40,right: 30),
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color:Colors.blueAccent.withOpacity(0.1),
                  ),
                  child: const Icon(LineAwesomeIcons.money_bill,size:18.0,color: Colors.blue,),
                ),
                title: Text("Payment",
                  style: TextStyle(
                    fontSize: 20,

                  ),),
                trailing: Container(
                  width:40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: const Icon(LineAwesomeIcons.angle_right,size: 18.0,color: Colors.grey,
                  ),


                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 40,right: 30),
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color:Colors.blueAccent.withOpacity(0.1),
                  ),
                  child: const Icon(LineAwesomeIcons.alternate_sign_out,size:18.0,color: Colors.blue,),
                ),
                title: InkWell(
                  onTap: (){
                    // Navigator.pop(context);
                    // Navigator.push(context, Materia);
                  },
                  child: Text("Logout",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,

                    ),),
                ),
                trailing: Container(
                  width:40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: const Icon(LineAwesomeIcons.angle_right,size: 18.0,color: Colors.grey,
                  ),


                ),
              )


            ],
          ),
        ),
      ),



    );

  }
}
//
// class ProfileMenuWidget extends StatelessWidget {
//   const ProfileMenuWidget({
//     Key? key,
//     required this.title,
//     required this.icon,
//     required this.onPress,
//     this.endIcon=true,
//     this
//   }) : super(key: key);
//
//   final String title;
//   final IconData icon;
//   final VoidCallback onPress;
//   final bool endIcon;
//   final Color? textColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Container(
//         width: 30, height: 30,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(100),
//           color:Colors.blueAccent.withOpacity(0.1),
//         ),
//         child: const Icon(LineAwesomeIcons.user_check,size:18.0,color: Colors.blue,),
//       ),
//       title: Text("User Details",
//       style: TextStyle(
//
//       ),),
//       trailing: Container(
//         width: 30,
//         height: 30,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(100),
//           color:Colors.grey.withOpacity(0.1),
//         ),
//         child: const Icon(LineAwesomeIcons.angle_right,size:18.0,color: Colors.grey,),
//       ),
//     );
//   }
// }