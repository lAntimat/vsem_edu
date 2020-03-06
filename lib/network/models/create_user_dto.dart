class CreateUserDto  {
  String firstName;
  String lastName;
  String contactPhone;
  String password;
  String cpassword;


  CreateUserDto(this.firstName, this.lastName, this.contactPhone, this.password,
      this.cpassword);

  Map<String, String> toJson() {
    final Map<String, dynamic> data = new Map<String, String>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['contact_phone'] = this.contactPhone;
    data['password'] = this.password;
    data['cpassword'] = this.cpassword;
    return data;
  }
}