
class Validations {
  static bool isValidUser(String user) {
    return (user != null && user.contains("@") && user.length > 6);
  }

  static bool isValidPass(String pass) {
    return (pass != null && pass.length > 6);
  }
}
