
import 'package:flutter/material.dart';
import 'package:shoptilyoudrop/app_state_container.dart';
import 'package:shoptilyoudrop/model/signup_model.dart';
import 'package:shoptilyoudrop/utils/constants.dart';
import 'package:shoptilyoudrop/utils/helpers.dart';

class SignUpBody extends StatefulWidget{
  final Function _parentStateCallback;

  SignUpBody(this._parentStateCallback);

  @override
  SignUpBodyState createState() => new SignUpBodyState(_parentStateCallback);
}

class SignUpBodyState extends State<SignUpBody>{
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final Function _parentStateCallback;
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _repeatPasswordController = new TextEditingController();

  SignUpModel _signUpModel = new SignUpModel();

  SignUpBodyState(this._parentStateCallback);

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new SizedBox(
                height: MediaQuery.of(context).size.height * 0.3
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Card(
                elevation: 10.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal:20.0),
                  child: Form(
                    key: _formKey,
                    child: new Column(
                      children: <Widget>[
                        new TextFormField(
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Enter email",
                            icon: new Icon(Icons.email, color: Colors.grey[400]),
                          ),
                          keyboardType: TextInputType.text,
                          onSaved: (String value) {this._signUpModel.email = value;},
                          validator: _validateEmail,
                        ),
                        SizedBox(height:10),
                        new TextFormField(
                          decoration: InputDecoration(
                            labelText: "Username",
                            hintText: "Enter username",
                            icon: new Icon(Icons.person, color: Colors.grey[400]),
                          ),
                          keyboardType: TextInputType.text,
                          onSaved: (String value) {this._signUpModel.displayName = value;},
                          validator: _validateUsername,
                        ),
                        SizedBox(height:10),
                        new TextFormField(
                          decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Enter password",
                            icon:   new Icon(Icons.lock, color: Colors.grey[400]),
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          onSaved: (String value) {_signUpModel.password = value;},
                          validator: _validatePassword,
                          controller: _passwordController
                        ),
                        SizedBox(height:10),
                        new TextFormField(
                          decoration: InputDecoration(
                            labelText: "Repeat Password",
                            hintText: "Re-enter password",
                            icon:   new Icon(Icons.lock, color: Colors.grey[400]),
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          validator: _validateRepeatPassword,
                          controller: _repeatPasswordController
                        ),
                        SizedBox(height:10),
                        Container(
                          width: double.infinity,
                          child: new RaisedButton(
                              onPressed: () => _signUp(context),
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              child: new Text("SIGN UP", style: TextStyle(color: Colors.white, fontSize: 22.0),)
                          ),
                        ),
                        SizedBox(
                            height:10
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
                onTap: (){ _parentStateCallback(true); },
                child: new Text("Already have an account? Click me to sign in", style: new TextStyle(color:Colors.grey, fontSize: 16.0),)
            ),
          ],
        )
    );
  }

  void _signUp(BuildContext context) async {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      
      var duration = 3;
      var success = await AppStateContainer.of(context).signUp(_signUpModel);
      if(success){
        Helpers.showSnackBar(
          context, "signup successful", duration: duration);
          _parentStateCallback(true);
      }
      else
        Helpers.showSnackBar(
          context, "signup failed", duration: duration);
    }
  }

  String _validateEmail(String value){
    var regex = new RegExp(
        "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$",
        caseSensitive: false,
        multiLine: false
    );

    if(!regex.hasMatch(value))
      return Constants.Error.ValidEmail;
    return null;
  }
  
  String _validateUsername(String value){
    if(value.length < 3)
      return Constants.Error.MinUsernameLength;
    return null;
  }

  String _validatePassword(String value){
    if(_passwordController.text.length < 6)
      return Constants.Error.PasswordMinLength;
    if(_passwordController.text != _repeatPasswordController.text)
      return Constants.Error.PasswordMismatch;
    return null;
  }

  String _validateRepeatPassword(String value){
    if(_repeatPasswordController.text.length < 6)
      return Constants.Error.PasswordMinLength;
    if(_repeatPasswordController.text != _passwordController.text)
      return Constants.Error.PasswordMismatch;
    return null;
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }
}