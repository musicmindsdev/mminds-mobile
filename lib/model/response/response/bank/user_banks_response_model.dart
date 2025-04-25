class UserBanksResponseModel {
  UserBanksResponseModel({
      this.message, 
      this.data, 
      this.code, 
      this.status,});

  UserBanksResponseModel.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    code = json['code'];
    status = json['status'];
  }
  String? message;
  Data? data;
  String? code;
  String? status;
UserBanksResponseModel copyWith({  String? message,
  Data? data,
  String? code,
  String? status,
}) => UserBanksResponseModel(  message: message ?? this.message,
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
      this.banks, 
      this.meta,});

  Data.fromJson(dynamic json) {
    if (json['banks'] != null) {
      banks = [];
      json['banks'].forEach((v) {
        banks?.add(Banks.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  List<Banks>? banks;
  Meta? meta;
Data copyWith({  List<Banks>? banks,
  Meta? meta,
}) => Data(  banks: banks ?? this.banks,
  meta: meta ?? this.meta,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (banks != null) {
      map['banks'] = banks?.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    return map;
  }

}

class Meta {
  Meta({
      this.total, 
      this.page, 
      this.limit, 
      this.totalPages, 
      this.hasNextPage, 
      this.hasPreviousPage,});

  Meta.fromJson(dynamic json) {
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
    totalPages = json['totalPages'];
    hasNextPage = json['hasNextPage'];
    hasPreviousPage = json['hasPreviousPage'];
  }
  num? total;
  num? page;
  num? limit;
  num? totalPages;
  bool? hasNextPage;
  bool? hasPreviousPage;
Meta copyWith({  num? total,
  num? page,
  num? limit,
  num? totalPages,
  bool? hasNextPage,
  bool? hasPreviousPage,
}) => Meta(  total: total ?? this.total,
  page: page ?? this.page,
  limit: limit ?? this.limit,
  totalPages: totalPages ?? this.totalPages,
  hasNextPage: hasNextPage ?? this.hasNextPage,
  hasPreviousPage: hasPreviousPage ?? this.hasPreviousPage,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['page'] = page;
    map['limit'] = limit;
    map['totalPages'] = totalPages;
    map['hasNextPage'] = hasNextPage;
    map['hasPreviousPage'] = hasPreviousPage;
    return map;
  }

}

class Banks {
  Banks({
      this.createdAt, 
      this.id, 
      this.userId, 
      this.bankId, 
      this.accountNumber, 
      this.accountName, 
      this.status, 
      this.isDefault, 
      this.bank,});

  Banks.fromJson(dynamic json) {
    createdAt = json['createdAt'];
    id = json['id'];
    userId = json['userId'];
    bankId = json['bankId'];
    accountNumber = json['accountNumber'];
    accountName = json['accountName'];
    status = json['status'];
    isDefault = json['isDefault'];
    bank = json['bank'] != null ? Bank.fromJson(json['bank']) : null;
  }
  String? createdAt;
  String? id;
  String? userId;
  String? bankId;
  String? accountNumber;
  String? accountName;
  String? status;
  bool? isDefault;
  Bank? bank;
Banks copyWith({  String? createdAt,
  String? id,
  String? userId,
  String? bankId,
  String? accountNumber,
  String? accountName,
  String? status,
  bool? isDefault,
  Bank? bank,
}) => Banks(  createdAt: createdAt ?? this.createdAt,
  id: id ?? this.id,
  userId: userId ?? this.userId,
  bankId: bankId ?? this.bankId,
  accountNumber: accountNumber ?? this.accountNumber,
  accountName: accountName ?? this.accountName,
  status: status ?? this.status,
  isDefault: isDefault ?? this.isDefault,
  bank: bank ?? this.bank,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = createdAt;
    map['id'] = id;
    map['userId'] = userId;
    map['bankId'] = bankId;
    map['accountNumber'] = accountNumber;
    map['accountName'] = accountName;
    map['status'] = status;
    map['isDefault'] = isDefault;
    if (bank != null) {
      map['bank'] = bank?.toJson();
    }
    return map;
  }

}

class Bank {
  Bank({
      this.createdAt, 
      this.id, 
      this.name, 
      this.code, 
      this.logo, 
      this.countryId, 
      this.platform,});

  Bank.fromJson(dynamic json) {
    createdAt = json['createdAt'];
    id = json['id'];
    name = json['name'];
    code = json['code'];
    logo = json['logo'];
    countryId = json['countryId'];
    platform = json['platform'];
  }
  String? createdAt;
  String? id;
  String? name;
  String? code;
  dynamic logo;
  String? countryId;
  String? platform;
Bank copyWith({  String? createdAt,
  String? id,
  String? name,
  String? code,
  dynamic logo,
  String? countryId,
  String? platform,
}) => Bank(  createdAt: createdAt ?? this.createdAt,
  id: id ?? this.id,
  name: name ?? this.name,
  code: code ?? this.code,
  logo: logo ?? this.logo,
  countryId: countryId ?? this.countryId,
  platform: platform ?? this.platform,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = createdAt;
    map['id'] = id;
    map['name'] = name;
    map['code'] = code;
    map['logo'] = logo;
    map['countryId'] = countryId;
    map['platform'] = platform;
    return map;
  }

}