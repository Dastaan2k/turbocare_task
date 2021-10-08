class APIResponse {

  dynamic data;
  bool error;
  int? statusCode;
  String? reasonPhrase;
  
  APIResponse({this.error=false,this.statusCode,this.reasonPhrase,this.data});

}