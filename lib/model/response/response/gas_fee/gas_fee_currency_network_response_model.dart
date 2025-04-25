class GasFeeCurrencyNetworkResponseModel {
  GasFeeCurrencyNetworkResponseModel({
      this.message, 
      this.data, 
      this.code, 
      this.status,});

  GasFeeCurrencyNetworkResponseModel.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    code = json['code'];
    status = json['status'];
  }
  String? message;
  Data? data;
  String? code;
  String? status;
GasFeeCurrencyNetworkResponseModel copyWith({  String? message,
  Data? data,
  String? code,
  String? status,
}) => GasFeeCurrencyNetworkResponseModel(  message: message ?? this.message,
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
    gasFees = json['gasFees'];
  }
  num? gasFees;
Data copyWith({  num? gasFees,
}) => Data(  gasFees: gasFees ?? this.gasFees,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['gasFees'] = gasFees;
    return map;
  }

}