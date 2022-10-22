class ResponseModel {
  String message = '';
  bool isSuccess = false;

  ResponseModel(this.isSuccess, this.message);

  ResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isSuccess = json['isSuccess'];
  }
}
