import 'package:flutter/material.dart';
import 'package:shoptilyoudrop/manager/session_manager.dart';

class CustomDrawer extends StatelessWidget{
  final String _username = SessionManager().getUserDetails().username;
  final String _email = SessionManager().getUserDetails().email;

  @override
  Widget build(BuildContext context){
    return new Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          new UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green[800]
            ),
            accountName: new Text(_username),
            accountEmail: new Text(_email),
            currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text(_username.substring(0,1))
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
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
            onTap: () {
              Navigator.pop(context);
              SessionManager().signOut(context);
            },
          ),
        ],
      ),
    );
  }
}