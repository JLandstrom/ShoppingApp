
import 'package:firebase_auth/firebase_auth.dart';

class AppState{
  bool isLoading;
  FirebaseUser user;

  AppState({this.isLoading = false, this.user});

  factory AppState.loading() => new AppState(isLoading: true);
}