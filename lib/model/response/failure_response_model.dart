class FailureResponseModel {
  FailureResponseModel({
      this.status, 
      this.message, 
      this.data,});

  FailureResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }
  String? status;
  String? message;
  dynamic data;
FailureResponseModel copyWith({  String? status,
  String? message,
  dynamic data,
}) => FailureResponseModel(  status: status ?? this.status,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['data'] = data;
    return map;
  }

}