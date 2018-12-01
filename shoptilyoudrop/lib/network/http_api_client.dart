import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

abstract class IHttpApiClient{
  Future<http.Response> get(String endpoint, Map headers, {int id});
  Future<http.Response> post(String endpoint, Map headers, Map data);
}

class HttpApiClient extends IHttpApiClient{
  final String baseUrl;

  HttpApiClient(this.baseUrl);

  @override
  Future<http.Response> get(String endpoint, Map headers, {int id = 0}) async {
    var finalEndpoint = endpoint;
    if(id > 0){
      finalEndpoint += "/" + id.toString();
    }
    return await http.get(new Uri.https(baseUrl, finalEndpoint), headers: headers);
  }

  @override
  Future<http.Response> post(String endpoint, Map headers, Map credentials) async {
    var uri = new Uri.https(baseUrl, endpoint);
    var body = json.encode(credentials);
    return await http.post(uri, headers: headers, body: body);
  }

}