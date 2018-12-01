
class HttpUtils{

  static bool IsOkResponse(int status){
    switch(status){
      case 200:
      case 201:
      case 204:
        return true;
      default:
        return false;
    }
  }
  
}