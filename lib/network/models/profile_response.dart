class ProfileResponse {
  String avatar;
  String firstName;
  String lastName;
  String fullName;
  String emailAddress;
  String contactPhone;

  ProfileResponse(this.avatar, this.firstName, this.lastName, this.fullName,
      this.emailAddress, this.contactPhone);

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    emailAddress = json['email_address'];
    contactPhone = json['contact_phone'];
  }
}
