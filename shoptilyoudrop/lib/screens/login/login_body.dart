import 'package:flutter/material.dart';
import 'package:shoptilyoudrop/app_state_container.dart';
import 'package:shoptilyoudrop/model/signin_model.dart';
import 'package:shoptilyoudrop/routes.dart';
import 'package:shoptilyoudrop/utils/constants.dart';
import 'package:shoptilyoudrop/utils/helpers.dart';

class LoginBody extends StatefulWidget{
  final Function _parentStateCallback;

  LoginBody(this._parentStateCallback);

  @override
  LoginBodyState createState() => new LoginBodyState(_parentStateCallback);
}

class LoginBodyState extends State<LoginBody>{
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final Function _parentStateCallback;

  SignInModel _signInModel = new SignInModel();

  LoginBodyState(this._parentStateCallback);

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
                          onSaved: (String value) {this._signInModel.email = value;},
                          validator: _validateNonEmpty,
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
                          onSaved: (String value) {this._signInModel.password = value;},
                          validator: _validateNonEmpty ,
                        ),
                        SizedBox(height:20),
                        Container(
                          width: double.infinity,
                          child: new RaisedButton(
                              onPressed: () => _signIn(context),
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              child: new Text("SIGN IN", style: TextStyle(color: Colors.white, fontSize: 22.0),)
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
            SizedBox(
                height: 10.0
            ),
            GestureDetector(
                onTap: (){},
                child: new Text("Forgot password? click me", style: new TextStyle(color:Colors.grey, fontSize: 16.0),)
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical:30.0, horizontal: 50.0),
                child: Container(
                  width: double.infinity,
                  child: new RaisedButton(

                    onPressed: (){ _parentStateCallback(false); },
                    child: new Text("No account? Sign up", style: new TextStyle(color:Colors.grey[700], fontSize: 16.0)),
                    color: Colors.grey[400],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  ),
                )
            ),
          ],
        )
    );
  }

  String _validateNonEmpty(String value){
    if(value.length <= 0)
      return Constants.Error.NonEmptyField;
    return null;
  }
 
  void _signIn(BuildContext context) async {
  FocusScope.of(context).requestFocus(new FocusNode());
  
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try{
        var container = AppStateContainer.of(context);
        var success = await container.signIn(_signInModel);
        if(success){
          Navigator.of(context).pushReplacementNamed(Routes.homePage);
        }
      }catch(exception){
        var duration = 3;
        Helpers.showSnackBar(
          context, Constants.Error.InvalidLogin, duration: duration);
      }
     
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}