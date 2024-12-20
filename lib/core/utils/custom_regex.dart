class MyRegex {
  static bool nameValidation(String? value) {
    if (value == null) return true;
    return !RegExp(r"^[a-zA-Z]+([ '-][a-zA-Z]+)*$").hasMatch(value);
  }

  static bool emailValidation(String? value) {
    if (value == null) return true;
    return !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(value);
  }

  static bool passwordValidation(String? value) {
    if (value == null) return true;
    return !RegExp(r'^[A-Za-z\d@$!%*?&]{8,}$').hasMatch(value);
  }
}
