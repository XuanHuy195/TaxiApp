class Info {
  int _id;
  String _name;
  String _phone;
  String _email;
  String _password;

  Info.fromData(id, name, phone, email, password) {
    _id = id;
    _name = name;
    _phone = phone;
    _email = email;
    _password = password;
  }
  int get id => _id;
  set id(int value) {
    _id = value;
  }

  String get name => _name;
  set name(String value) {
    _name = value;
  }

  String get phone => _phone;
  set phone(String value) {
    _phone = value;
  }

  String get email => _email;
  set email(String value) {
    _email = value;
  }

  String get password => _password;
  set password(String value) {
    _password = value;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'name': _name,
      'phone': _phone,
      'email': _email,
      'password': _password
    };
  }
}
