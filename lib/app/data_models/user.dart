class User {
  final int id;
  final String firstName;
  final String lastName;
  final String phoenNumber;
  final String email;
  final String profilePhotoUrl;
  final String fullName;
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoenNumber,
    required this.email,
    required this.profilePhotoUrl,
    required this.fullName,
  });

  factory User.fromJson(jsonData) {
    return User(
      id: int.parse(jsonData["id"].toString()),
      firstName: jsonData["first_name"],
      lastName: jsonData["last_name"],
      email: jsonData["email"],
      phoenNumber: jsonData["phone_number"].toString(),
      profilePhotoUrl: jsonData["profile_photo_url"],
      fullName: "${jsonData["first_name"]} ${jsonData["last_name"]}",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "first_name": this.firstName,
      "last_name": this.lastName,
      "id": this.id,
      "email": this.email,
      "phone_number": this.phoenNumber,
      "profile_photo_url": this.profilePhotoUrl,
    };
  }
}
