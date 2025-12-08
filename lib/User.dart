/// name : "John"
/// age : 30

class User {
  String _name = "";
  num _age = 0;

  User({required String name, required num age}) {
    _name = name;
    _age = age;
  }

  User.fromJson(dynamic json) {
    _name = json['name'];
    _age = json['age'];
  }

  User copyWith({String? name, num? age}) =>
      User(name: name ?? _name, age: age ?? _age);

  String get name => _name;

  num get age => _age;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['age'] = _age;
    return map;
  }
}
