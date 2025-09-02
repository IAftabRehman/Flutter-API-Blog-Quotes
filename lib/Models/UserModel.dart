class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String image;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      name: "${json['firstName']} ${json['lastName']}",
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
