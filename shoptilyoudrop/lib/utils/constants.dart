
class Constants{
  static const _AppConstants App = const _AppConstants();
  static const _ErrorConstants Error = const _ErrorConstants();
  static const _Authorization Authorization = const _Authorization();
  static const _Confirmation Confirmation = const _Confirmation();
}

class _AppConstants{
  const _AppConstants();
  final String AppTitle = "My Groceries";
}

class _ErrorConstants{
  const _ErrorConstants();
  final String InvalidLogin = "Invalid username/password";
  final String UsernamEmpty = "Username required";
  final String PasswordEmpty = "Password required";
  final String ValidEmail = "Valid Email required";

  final String NetworkError = "Network error";
  final String MissingSeveralRequiredFields = "Required data missing";
  final String MinUsernameLength = "At least three characters required";
  final String NonEmptyField = "Field cannot be empty";

  final String PasswordMismatch = "Passwords must match";
  final String PasswordMinLength = "Passwords must be at least 6 characters";
}

class _Authorization{
  const _Authorization();
  final String AuthToken = "auth_token";
}

class _Confirmation{
  const _Confirmation();
  final String UserCreated = "User created successfully";
}
