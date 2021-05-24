class RegisterRequest {
  String name;
  String email;
  String phone;
  String password;
  String repassword;

  RegisterRequest(
      {this.name, this.email, this.phone, this.password, this.repassword});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['repassword'] = this.repassword;
    return data;
  }
}
