import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final imgUrl =
      "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text(
                    'khan zaki',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                  accountEmail: Text(
                    'zaki@gmail.com',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imgUrl),
                  ),
                )
              ),
              ListTile(
                leading: Icon(CupertinoIcons.home,color: Colors.white,),
                title:Text("Home",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.person_fill,color: Colors.white,),
                title:Text("Profile",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.mail,color: Colors.white,),
                title:Text("Home",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),),
              ),
          ],
        ),
      ),
    );
  }
}
