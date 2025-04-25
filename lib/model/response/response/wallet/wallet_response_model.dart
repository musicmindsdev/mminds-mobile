class WalletResponseModel {
  WalletResponseModel({
      this.message, 
      this.data, 
      this.code, 
      this.status,});

  WalletResponseModel.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    code = json['code'];
    status = json['status'];
  }
  String? message;
  Data? data;
  String? code;
  String? status;
WalletResponseModel copyWith({  String? message,
  Data? data,
  String? code,
  String? status,
}) => WalletResponseModel(  message: message ?? this.message,
  data: data ?? this.data,
  code: code ?? this.code,
  status: status ?? this.status,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['code'] = code;
    map['status'] = status;
    return map;
  }

}

class Data {
  Data({
      this.userWallets,});

  Data.fromJson(dynamic json) {
    if (json['userWallets'] != null) {
      userWallets = [];
      json['userWallets'].forEach((v) {
        userWallets?.add(UserWallets.fromJson(v));
      });
    }
  }
  List<UserWallets>? userWallets;
Data copyWith({  List<UserWallets>? userWallets,
}) => Data(  userWallets: userWallets ?? this.userWallets,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (userWallets != null) {
      map['userWallets'] = userWallets?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class UserWallets {
  UserWallets({
      this.createdAt, 
      this.id, 
      this.userId, 
      this.currency, 
      this.network, 
      this.walletAddress, 
      this.provider,});

  UserWallets.fromJson(dynamic json) {
    createdAt = json['createdAt'];
    id = json['id'];
    userId = json['userId'];
    currency = json['currency'];
    network = json['network'];
    walletAddress = json['walletAddress'];
    provider = json['provider'];
  }
  String? createdAt;
  String? id;
  String? userId;
  String? currency;
  String? network;
  String? walletAddress;
  String? provider;
UserWallets copyWith({  String? createdAt,
  String? id,
  String? userId,
  String? currency,
  String? network,
  String? walletAddress,
  String? provider,
}) => UserWallets(  createdAt: createdAt ?? this.createdAt,
  id: id ?? this.id,
  userId: userId ?? this.userId,
  currency: currency ?? this.currency,
  network: network ?? this.network,
  walletAddress: walletAddress ?? this.walletAddress,
  provider: provider ?? this.provider,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = createdAt;
    map['id'] = id;
    map['userId'] = userId;
    map['currency'] = currency;
    map['network'] = network;
    map['walletAddress'] = walletAddress;
    map['provider'] = provider;
    return map;
  }

}