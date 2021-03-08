class Request {
  const Request();
}

class ApiMethod {
  final String url;
  final String method;
  final Map? head;

  const ApiMethod(this.url, this.method, {this.head});
}

class HttpRequestType {
  static const String GET = "get";
  static const String POST = "post";
}
