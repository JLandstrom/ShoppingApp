
class Constants{
  static const _AppConstants App = const _AppConstants();
  static const _ErrorConstants Error = const _ErrorConstants();
  static const _Authorization Authorization = const _Authorization();
}

class _AppConstants{
  const _AppConstants();
  final String AppTitle = "My Groceries";
}

class _ErrorConstants{
  const _ErrorConstants();
  final String InvalidLogin = "Invalid username/password";
  final String UsernamEmpty = "Username can't be empty";
  final String PasswordEmpty = "Password can't be empty";
  final String NetworkError = "Network error";   
}

class _Authorization{
  const _Authorization();
  final String AuthToken = "auth_token";
}
