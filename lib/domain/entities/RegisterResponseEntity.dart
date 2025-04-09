class RegisterResponseEntity {
  RegisterResponseEntity({
    this.message,
    this.user,
    this.statusMsg,
    this.token,
  });

  String? message;
  UserEntity? user;
  String? statusMsg;
  String? token;
}

class UserEntity {
  UserEntity({
    this.name,
    this.email,
  });

  String? name;
  String? email;
}
