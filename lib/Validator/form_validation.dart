extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidPhone{
    final phoneRegExp = RegExp(r"^[0-9]*$");
    return phoneRegExp.hasMatch(this);
  }
}