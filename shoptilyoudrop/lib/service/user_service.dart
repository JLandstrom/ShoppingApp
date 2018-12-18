import 'dart:async';
import 'package:shoptilyoudrop/model/signup_model.dart';
import 'package:shoptilyoudrop/network/http_api_client.dart';
import 'package:shoptilyoudrop/utils/constants.dart';
import 'package:shoptilyoudrop/network/http_utils.dart';
import 'package:shoptilyoudrop/model/user.dart';
import 'package:shoptilyoudrop/utils/extensions/string_extensions.dart';
import 'dart:convert';


class UserService{
  static const String _developmentHost = "192.168.1.189:61873";
  static const String _productionHost = "shoppingapidev.azurewebsites.net:443";
  final IHttpApiClient _apiClient = new HttpApiClient(_productionHost);
  
  UserService();

  String _latestError;
  String latestError() => _latestError;
  
  Future<String> authenticate(String username, String password) async {
    _latestError = "";
    if(StringExtensions.IsNullOrEmpty(username)){
      _latestError = Constants.Error.UsernamEmpty;
      return null;
    }
    if(StringExtensions.IsNullOrEmpty(password)){
      _latestError = Constants.Error.PasswordEmpty;
      return null;
    }
    var headers = _buildHeaders();
    var body = _buildLoginBody(username, password);
    try{
      var authenticationResponse = await _apiClient.post("/api/Login/", headers, body);
      if(HttpUtils.IsOkResponse(authenticationResponse.statusCode)){
        Map response = json.decode(authenticationResponse.body);
        return response['token'];
      }
      else if(authenticationResponse.statusCode == 401){
        _latestError = Constants.Error.InvalidLogin;
      }
    }catch(exception){
      //Log(exception)
      _latestError = Constants.Error.NetworkError;
    } 
    return null;
  }

  Future<User> getUser(String token) async {
    _latestError = "";
    if(token == null || token == "" )
      return null;
    var headers = _buildHeaders();
    headers['Authorization'] = 'Bearer ' + token;
    try{
      var response = await _apiClient.get("api/Account/", headers);
      if(HttpUtils.IsOkResponse(response.statusCode)) {
        var body = json.decode(response.body);
        if (!StringExtensions.AnyIsNullOrEmpty(
            [body['id'], body['userName'], body['email']]))
          return new User(body['id'], body['userName'], body['email']);
      }
    }catch(exception){
      //Log(exception)
      _latestError = Constants.Error.NetworkError;
    }
    return null;
  }

  Future<bool> signUp(SignUpModel signUpModel) async {
    _latestError = "";

    var headers = _buildHeaders();
    var body = _buildCreationBody(signUpModel.email, signUpModel.displayName, signUpModel.password);

    try{
      var response = await _apiClient.post("api/Account/", headers, body);
      if(HttpUtils.IsOkResponse(response.statusCode))
        return true;
    }catch(exception){
      //Log(exception)
      _latestError = Constants.Error.NetworkError;
    }
    return false;
  }

  Map _buildHeaders() {
    Map headers = new Map<String, String>();
    headers["Content-Type"] = "Application/json; charset=utf-8";
    return headers;
  }

  Map _buildLoginBody(String username, String password) {
    Map body = new Map<String, String>();
    body["email"] = username;
    body["password"] = password;
    return body;
  }

  Map _buildCreationBody(String email, String username, String password ) {
    Map body = new Map<String, String>();
    body["email"] = username;
    body["username"] = username;
    body["password"] = password;
    body["role"] = "Admin";
    return body;
  }
}
