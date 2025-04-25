
class UserResponseModel {
  UserResponseModel({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.address, 
      this.profileImage, 
      this.createdAt, 
      this.updatedAt, 
      this.email, 
      this.emailVerifiedAt, 
      this.emailVerifyToken, 
      this.phone, 
      this.gender, 
      this.referral, 
      this.referralCode, 
      this.twoFactor, 
      this.emailNotify,});

  UserResponseModel.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address = json['address'];
    profileImage = json['profile_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    emailVerifyToken = json['email_verify_token'];
    phone = json['phone'];
    gender = json['gender'];
    referral = json['referral'];
    referralCode = json['referral_code'];
    twoFactor = json['two_factor'];
    emailNotify = json['email_notify'];
  }
  num? id;
  String? firstName;
  String? lastName;
  String? address;
  String? profileImage;
  String? createdAt;
  String? updatedAt;
  String? email;
  String? emailVerifiedAt;
  num? emailVerifyToken;
  String? phone;
  String? gender;
  String? referral;
  String? referralCode;
  num? twoFactor;
  num? emailNotify;
UserResponseModel copyWith({  num? id,
  String? firstName,
  String? lastName,
  String? address,
  String? profileImage,
  String? createdAt,
  String? updatedAt,
  String? email,
  String? emailVerifiedAt,
  num? emailVerifyToken,
  String? phone,
  String? gender,
  String? referral,
  String? referralCode,
  num? twoFactor,
  num? emailNotify,
}) => UserResponseModel(  id: id ?? this.id,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  address: address ?? this.address,
  profileImage: profileImage ?? this.profileImage,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  email: email ?? this.email,
  emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
  emailVerifyToken: emailVerifyToken ?? this.emailVerifyToken,
  phone: phone ?? this.phone,
  gender: gender ?? this.gender,
  referral: referral ?? this.referral,
  referralCode: referralCode ?? this.referralCode,
  twoFactor: twoFactor ?? this.twoFactor,
  emailNotify: emailNotify ?? this.emailNotify,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['address'] = address;
    map['profile_image'] = profileImage;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['email_verify_token'] = emailVerifyToken;
    map['phone'] = phone;
    map['gender'] = gender;
    map['referral'] = referral;
    map['referral_code'] = referralCode;
    map['two_factor'] = twoFactor;
    map['email_notify'] = emailNotify;
    return map;
  }

}