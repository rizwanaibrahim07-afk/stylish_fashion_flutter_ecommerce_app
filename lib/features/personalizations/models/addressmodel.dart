

class AddressModel {
  final String id;
  final String userId;
  final String? name;
  final String? phoneNumber;
  final String? houseName;

  final String? city;
  final String? state;
  final String? postalCode;
  final String? country;
   bool isDefault;

  AddressModel({
    required this.id,
    required this.userId,
     this.name,
    this.phoneNumber,
     this.houseName,   this.city,  this.state,  this.postalCode,  this.country,
     required this.isDefault,
  });


  factory AddressModel.fromMap(Map<String, dynamic> map){
    return AddressModel(
      id: map['id']??'',
      name: map['name']??'',
      userId: map['userId']??'',
      phoneNumber: map[ 'phoneNumber']??'',
      isDefault: map['isDefault'] ?? false,
      houseName: map['houseName']??'',
      city: map[ 'city']??'',
      state: map['state']??'',
      postalCode: map[ 'postalCode']??'',
      country: map['country']??'',);
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'phoneNumber': phoneNumber,
      'houseName': houseName,

      'city': city,
      'state': state,
      'postalCode': postalCode,
      'country': country,
      'is_default': isDefault,
    };
  }


  }


