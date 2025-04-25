class GasFeeCurrencyResponseModel {
  GasFeeCurrencyResponseModel({
      this.message, 
      this.data, 
      this.code, 
      this.status,});

  GasFeeCurrencyResponseModel.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    code = json['code'];
    status = json['status'];
  }
  String? message;
  Data? data;
  String? code;
  String? status;
GasFeeCurrencyResponseModel copyWith({  String? message,
  Data? data,
  String? code,
  String? status,
}) => GasFeeCurrencyResponseModel(  message: message ?? this.message,
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
      this.fee,});

  Data.fromJson(dynamic json) {
    fee = json['fee'];
  }
  num? fee;
Data copyWith({  num? fee,
}) => Data(  fee: fee ?? this.fee,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fee'] = fee;
    return map;
  }

}