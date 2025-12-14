class UserModel {
  final String id;
  late String? name;
  late String? userName;
  late String? email;
  late String? phoneNumber;
  late final String? avatarUrl;

  UserModel(
      {required this.id, this.name, this.userName, this.email, this.phoneNumber, this.avatarUrl });

  // Factory constructor to convert map from Supabase to UserModel
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String?,
      userName: map['userName'] as String?, email: map['email'] as String?,
      phoneNumber: map['phoneNumber'] as String?, avatarUrl: map['avatarUrl'] as String?,
    );
  }

  // Method to convert UserModel to Mapfor updating Supabase
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'userName':userName,
      'email':email,
     ' phoneNumber': phoneNumber,'avatarUrl':avatarUrl,
    };
  }

//copy updated values
UserModel copyWith({String? name,String? userName,String? phoneNumber,String? avatarUrl})
{
  return UserModel(id: id,email: email,name:name,userName: userName,phoneNumber:phoneNumber,avatarUrl: avatarUrl );
}
}