class Validator {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Email cannot be empty";
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      return "Enter a valid email address";
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Password cannot be empty";
    }

    final passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$',
    );
    if (!passwordRegex.hasMatch(password)) {
      return "Password must be at least 8 characters long,\ninclude upper & lower case, a number, and a special character";
    }

    return null;
  }
  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return "Name cannot be empty";
    }

    final nameRegex = RegExp(r"^[a-zA-Z\s]{2,}$");
    if (!nameRegex.hasMatch(name)) {
      return "Name must contain only letters and spaces,\nand be at least 2 characters long";
    }
    return null;
  }
}
