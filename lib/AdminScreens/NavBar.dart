import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('offlutter.com'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture:CircleAvatar(
              child:ClipOval(
                child:Image.network('https://www.peacenepaltreks.com/public/uploads/HIMALAYAN-PEAKS-OF-NEPAL.png',
               // decoration:BoxDecoration(
               //   image:DecorationImage(
                   fit:BoxFit.cover,
                   // image:AssetImage("Images/Goshaikunda.jpg"),
                   width:60,
                   height:60 ,
               ),
              ),
            ),
            decoration: BoxDecoration(
              color : Colors.blue,
              image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("Images/Goshaikunda.jpg")),
              ),
            ),
          ListTile(
            leading: Icon(Icons.cloud_circle),
            title: Text('Weather'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payment'),
            onTap: () => null,
          ) ,
          Divider(),

          ListTile(
            leading: Icon(Icons.rate_review),
            title: Text('Rate and Review'),
            onTap: () => null,
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () => null,
          ) ,
          Divider(),

        ],
      ),
    );
  }
}