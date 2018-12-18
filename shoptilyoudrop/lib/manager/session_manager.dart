// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:shoptilyoudrop/model/signin_model.dart';
// import 'package:shoptilyoudrop/model/signup_model.dart';
// import 'dart:async';
// import 'package:shoptilyoudrop/utils/constants.dart';
// import 'package:shoptilyoudrop/model/user.dart';

// class SessionManager{
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
//   static final SessionManager _sessionManager = new SessionManager._internal();
  
//   factory SessionManager(){
//     return _sessionManager;
//   }

//   SessionManager._internal();


//   Future<String> signIn(SignInModel signInModel) async {
//     FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(email: signInModel.email, password: signInModel.password);
//     return user.uid;
//   }

//   Future<String> signUp(SignUpModel signUpModel) async {
//     FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(email: signUpModel.email, password: signUpModel.password);
//     user.updateProfile(new UpdateUserInfo())
//   }

//   Future<FirebaseUser> getUser(User user) async {
//     return await _firebaseAuth.currentUser();
//   }

//   User getUserDetails(){
//     return _user;
//   }

//   Future<void> signOut(BuildContext context) async {
//     FireBase
//   }

// }