class GasFeeResponseModel {
  GasFeeResponseModel({
      this.message, 
      this.data, 
      this.code, 
      this.status,});

  GasFeeResponseModel.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    code = json['code'];
    status = json['status'];
  }
  String? message;
  Data? data;
  String? code;
  String? status;
GasFeeResponseModel copyWith({  String? message,
  Data? data,
  String? code,
  String? status,
}) => GasFeeResponseModel(  message: message ?? this.message,
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
      this.gasFees,});

  Data.fromJson(dynamic json) {
    gasFees = json['gasFees'] != null ? GasFees.fromJson(json['gasFees']) : null;
  }
  GasFees? gasFees;
Data copyWith({  GasFees? gasFees,
}) => Data(  gasFees: gasFees ?? this.gasFees,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (gasFees != null) {
      map['gasFees'] = gasFees?.toJson();
    }
    return map;
  }

}

class GasFees {
  GasFees({
      this.usdt, 
      this.sol, 
      this.eth, 
      this.btc,});

  GasFees.fromJson(dynamic json) {
    usdt = json['usdt'] != null ? Usdt.fromJson(json['usdt']) : null;
    sol = json['sol'];
    eth = json['eth'];
    btc = json['btc'];
  }
  Usdt? usdt;
  num? sol;
  num? eth;
  num? btc;
GasFees copyWith({  Usdt? usdt,
  num? sol,
  num? eth,
  num? btc,
}) => GasFees(  usdt: usdt ?? this.usdt,
  sol: sol ?? this.sol,
  eth: eth ?? this.eth,
  btc: btc ?? this.btc,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (usdt != null) {
      map['usdt'] = usdt?.toJson();
    }
    map['sol'] = sol;
    map['eth'] = eth;
    map['btc'] = btc;
    return map;
  }

}

class Usdt {
  Usdt({
      this.trc20, 
      this.bep20,});

  Usdt.fromJson(dynamic json) {
    trc20 = json['trc20'];
    bep20 = json['bep20'];
  }
  num? trc20;
  num? bep20;
Usdt copyWith({  num? trc20,
  num? bep20,
}) => Usdt(  trc20: trc20 ?? this.trc20,
  bep20: bep20 ?? this.bep20,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['trc20'] = trc20;
    map['bep20'] = bep20;
    return map;
  }

}