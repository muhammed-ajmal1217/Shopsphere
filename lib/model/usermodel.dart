class UserModel{
  String? name;
  String? email;
  String? uid;
  UserModel({
    this.email,
    this.uid,
    this.name,
  });
 factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
      name: json['name'],
      email: json['email'],
      uid: json['uid']
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'name':name,
      'email':email,
      'uid':uid,
    };
  }
}