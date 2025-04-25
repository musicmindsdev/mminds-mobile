class FiatWalletResponseModel {
  FiatWalletResponseModel({
      this.message, 
      this.data, 
      this.code, 
      this.status,});

  FiatWalletResponseModel.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    code = json['code'];
    status = json['status'];
  }
  String? message;
  Data? data;
  String? code;
  String? status;
FiatWalletResponseModel copyWith({  String? message,
  Data? data,
  String? code,
  String? status,
}) => FiatWalletResponseModel(  message: message ?? this.message,
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
      this.wallets, 
      this.meta,});

  Data.fromJson(dynamic json) {
    if (json['wallets'] != null) {
      wallets = [];
      json['wallets'].forEach((v) {
        wallets?.add(Wallets.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  List<Wallets>? wallets;
  Meta? meta;
Data copyWith({  List<Wallets>? wallets,
  Meta? meta,
}) => Data(  wallets: wallets ?? this.wallets,
  meta: meta ?? this.meta,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (wallets != null) {
      map['wallets'] = wallets?.map((v) => v.toJson()).toList();
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

class Wallets {
  Wallets({
      this.createdAt, 
      this.id, 
      this.userId, 
      this.currencyId, 
      this.balance, 
      this.lockedBalance, 
      this.isActive, 
      this.lastTransactionAt, 
      this.currency,});

  Wallets.fromJson(dynamic json) {
    createdAt = json['createdAt'];
    id = json['id'];
    userId = json['userId'];
    currencyId = json['currencyId'];
    balance = json['balance'];
    lockedBalance = json['lockedBalance'];
    isActive = json['isActive'];
    lastTransactionAt = json['lastTransactionAt'];
    currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
  }
  String? createdAt;
  String? id;
  String? userId;
  String? currencyId;
  num? balance;
  num? lockedBalance;
  bool? isActive;
  dynamic lastTransactionAt;
  Currency? currency;
Wallets copyWith({  String? createdAt,
  String? id,
  String? userId,
  String? currencyId,
  num? balance,
  num? lockedBalance,
  bool? isActive,
  dynamic lastTransactionAt,
  Currency? currency,
}) => Wallets(  createdAt: createdAt ?? this.createdAt,
  id: id ?? this.id,
  userId: userId ?? this.userId,
  currencyId: currencyId ?? this.currencyId,
  balance: balance ?? this.balance,
  lockedBalance: lockedBalance ?? this.lockedBalance,
  isActive: isActive ?? this.isActive,
  lastTransactionAt: lastTransactionAt ?? this.lastTransactionAt,
  currency: currency ?? this.currency,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = createdAt;
    map['id'] = id;
    map['userId'] = userId;
    map['currencyId'] = currencyId;
    map['balance'] = balance;
    map['lockedBalance'] = lockedBalance;
    map['isActive'] = isActive;
    map['lastTransactionAt'] = lastTransactionAt;
    if (currency != null) {
      map['currency'] = currency?.toJson();
    }
    return map;
  }

}

class Currency {
  Currency({
      this.createdAt, 
      this.id, 
      this.name, 
      this.currencyCode, 
      this.symbol,});

  Currency.fromJson(dynamic json) {
    createdAt = json['createdAt'];
    id = json['id'];
    name = json['name'];
    currencyCode = json['currencyCode'];
    symbol = json['symbol'];
  }
  String? createdAt;
  String? id;
  String? name;
  String? currencyCode;
  String? symbol;
Currency copyWith({  String? createdAt,
  String? id,
  String? name,
  String? currencyCode,
  String? symbol,
}) => Currency(  createdAt: createdAt ?? this.createdAt,
  id: id ?? this.id,
  name: name ?? this.name,
  currencyCode: currencyCode ?? this.currencyCode,
  symbol: symbol ?? this.symbol,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = createdAt;
    map['id'] = id;
    map['name'] = name;
    map['currencyCode'] = currencyCode;
    map['symbol'] = symbol;
    return map;
  }

}