
class User {
  final int id;
  final int isVerified;

  User({
    required this.id,
    required this.isVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    isVerified: json["isVerified"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isVerified": isVerified,
  };
}