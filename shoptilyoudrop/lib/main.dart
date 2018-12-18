import 'package:flutter/material.dart';
import 'package:shoptilyoudrop/app.dart';
import 'package:shoptilyoudrop/app_state_container.dart';
import 'package:shoptilyoudrop/manager/auth_manager.dart';

void main() {
    runApp(new AppStateContainer(child:new AppRoot(), authManager: new AuthManager()));
}
