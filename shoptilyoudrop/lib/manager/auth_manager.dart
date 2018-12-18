
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoptilyoudrop/model/signin_model.dart';
import 'package:shoptilyoudrop/model/signup_model.dart';

abstract class IAuthManager{
  Future<FirebaseUser> signIn(SignInModel signInModel);
  Future<FirebaseUser> signUp(SignUpModel signUpModel);
  Future<FirebaseUser> getUser();
  Future<void> signOut();
}

class AuthManager extends IAuthManager{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<FirebaseUser> getUser() async {
    return _firebaseAuth.currentUser();
  }

  @override
  Future<FirebaseUser> signIn(SignInModel signInModel) async {
    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(email: signInModel.email, password: signInModel.password);
    return user;
  }

  @override
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  @override
  Future<FirebaseUser> signUp(SignUpModel signUpModel) async {
    FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(email: signUpModel.email, password: signUpModel.password);
    var userInfo = new UserUpdateInfo();
    userInfo.displayName = signUpModel.displayName;
    await user.updateProfile(userInfo);
    return user;
  }

}