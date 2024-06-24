class User {
  String? id;
  String? username;
  String? email;

  User({this.id, this.username, this.email});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'username': username,
        'email': email,
      };
}
