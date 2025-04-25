class UserResponseModel {
  UserResponseModel({
      this.status, 
      this.message, 
      this.data,});

  UserResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  Data? data;
UserResponseModel copyWith({  String? status,
  String? message,
  Data? data,
}) => UserResponseModel(  status: status ?? this.status,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.username, 
      this.email, 
      this.name, 
      this.bio, 
      this.avatar, 
      this.gender, 
      this.isVerified, 
      this.isShadowBanned, 
      this.createdAt, 
      this.updatedAt, 
      this.botScore, 
      this.profileId, 
      this.active, 
      this.role,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    name = json['name'];
    bio = json['bio'];
    avatar = json['avatar'];
    gender = json['gender'];
    isVerified = json['isVerified'];
    isShadowBanned = json['isShadowBanned'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    botScore = json['botScore'];
    profileId = json['profileId'];
    active = json['active'];
    role = json['role'];
  }
  String? id;
  String? username;
  String? email;
  String? name;
  dynamic bio;
  dynamic avatar;
  dynamic gender;
  bool? isVerified;
  bool? isShadowBanned;
  String? createdAt;
  String? updatedAt;
  num? botScore;
  dynamic profileId;
  bool? active;
  String? role;
Data copyWith({  String? id,
  String? username,
  String? email,
  String? name,
  dynamic bio,
  dynamic avatar,
  dynamic gender,
  bool? isVerified,
  bool? isShadowBanned,
  String? createdAt,
  String? updatedAt,
  num? botScore,
  dynamic profileId,
  bool? active,
  String? role,
}) => Data(  id: id ?? this.id,
  username: username ?? this.username,
  email: email ?? this.email,
  name: name ?? this.name,
  bio: bio ?? this.bio,
  avatar: avatar ?? this.avatar,
  gender: gender ?? this.gender,
  isVerified: isVerified ?? this.isVerified,
  isShadowBanned: isShadowBanned ?? this.isShadowBanned,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  botScore: botScore ?? this.botScore,
  profileId: profileId ?? this.profileId,
  active: active ?? this.active,
  role: role ?? this.role,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['email'] = email;
    map['name'] = name;
    map['bio'] = bio;
    map['avatar'] = avatar;
    map['gender'] = gender;
    map['isVerified'] = isVerified;
    map['isShadowBanned'] = isShadowBanned;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['botScore'] = botScore;
    map['profileId'] = profileId;
    map['active'] = active;
    map['role'] = role;
    return map;
  }

}