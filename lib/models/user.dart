class User {
  final String? name;
  final String? pass;

  User({
    required this.name,
    required this.pass,
  });

  User.formMap(Map<dynamic, dynamic> res)
      : name = res['name'],
        pass = res['pass'];

  Map<String, Object?> toMap() {
    return {
      'name': name,
      'pass': pass,
    };
  }
}
