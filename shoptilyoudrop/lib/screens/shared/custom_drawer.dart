import 'package:flutter/material.dart';
import 'package:shoptilyoudrop/app_state_container.dart';
import 'package:shoptilyoudrop/routes.dart';

class CustomDrawer extends StatelessWidget{
  CustomDrawer();

  @override
  Widget build(BuildContext context){
    var container = AppStateContainer.of(context);
    var user = container.state.user;
    return new Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          new UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green[800]
            ),
            accountName: new Text(user.displayName ?? ""),
            accountEmail: new Text(user.email),
            currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text((user.displayName ?? "").length > 0 ? user.displayName.substring(0,1) : "")
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed(Routes.homePage);
            },
          ),
          Divider(height: 4.0,),
          ListTile(
            title: Text('My profile'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(height: 4.0,),
          ListTile(
            title: Text('Log out'),
            onTap: () async {
              Navigator.pop(context);
              await container.signOut();
              Navigator.of(context).pushReplacementNamed(Routes.authPage);
            },
          ),
        ],
      ),
    );
  }
}