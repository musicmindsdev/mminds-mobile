class LoginSuccessfulResponseModel {
  LoginSuccessfulResponseModel({
      this.status, 
      this.message, 
      this.data,});

  LoginSuccessfulResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  Data? data;
LoginSuccessfulResponseModel copyWith({  String? status,
  String? message,
  Data? data,
}) => LoginSuccessfulResponseModel(  status: status ?? this.status,
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
      this.accessToken,});

  Data.fromJson(dynamic json) {
    accessToken = json['accessToken'];
  }
  String? accessToken;
Data copyWith({  String? accessToken,
}) => Data(  accessToken: accessToken ?? this.accessToken,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = accessToken;
    return map;
  }

}