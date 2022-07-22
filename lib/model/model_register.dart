class RegisterModel {
  String? localDateTime;
  String? responseCode;
  String? message;
  String? data;

  RegisterModel(
      {this.localDateTime, this.responseCode, this.message, this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    localDateTime = json['localDateTime'];
    responseCode = json['responseCode'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['localDateTime'] = localDateTime;
    data['responseCode'] = responseCode;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
