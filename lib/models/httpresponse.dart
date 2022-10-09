class HTTPResponse<List> {
  bool isSuccessful;
  List data;
  int statusCode;
  String message;
  HTTPResponse(this.isSuccessful, this.data, {required this.message, required this.statusCode});
}
