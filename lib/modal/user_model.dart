class UserModel {
  String email;
  String name;
  String image;

  UserModel({
    required this.email,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> get toMap => {
        'name': name,
        'email': email,
        'image': image,
      };
}
