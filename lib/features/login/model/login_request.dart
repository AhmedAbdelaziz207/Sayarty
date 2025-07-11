class LoginRequest {
  String phone;
  String role;

  String? password;

  LoginRequest(this.phone, this.role, this.password);

  Map<String, dynamic> userLoginToJson() {
    return {"phone": phone, "type": role};
  }

  Map<String, dynamic> techLoginToJson() {
    return {"phone": phone, "type": role, "password": password};
  }
}
