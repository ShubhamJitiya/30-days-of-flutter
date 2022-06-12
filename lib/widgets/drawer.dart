// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imgUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_Orb9z2C5txd_RpddIzZyCFd76A4lHJg67A&usqp=CAU";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  // decoration: BoxDecoration(
                  //   color: Colors.red,
                  // ),
                  accountName: Text("Shubham Jitiya"),
                  accountEmail: Text("jitiya66@gmail.com"),
                  // currentAccountPicture: Image.network(src),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imgUrl),
                  ),
                )),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2 ,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2 ,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "E-mail me",
                textScaleFactor: 1.2 ,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
