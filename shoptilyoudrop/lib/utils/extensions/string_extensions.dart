
class StringExtensions{
  static bool IsNullOrEmpty(String value){
    if(value == null) return true;
    if(value.trim().isEmpty) return true;
    return false;
  }

  static bool AnyIsNullOrEmpty(List values){
    for(int i = 0; i < values.length; i++){
      if(values[i] is String && IsNullOrEmpty(values[i]))
        return true;
    }
    return false;
  }
}