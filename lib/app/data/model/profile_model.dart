class ProfileModel {
  String userName;
  String email;
  String phoneNumber;
  String? profileImage;

  ProfileModel({
    required this.userName,
    required this.email,
    required this.phoneNumber,
    this.profileImage,
  });
}