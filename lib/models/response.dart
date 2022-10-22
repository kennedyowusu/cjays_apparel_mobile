class ResponseModel {
  String message = '';
  bool isSuccess = false;

  ResponseModel(this.isSuccess, this.message);

  ResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isSuccess = json['isSuccess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['isSuccess'] = isSuccess;
    return data;
  }
}
