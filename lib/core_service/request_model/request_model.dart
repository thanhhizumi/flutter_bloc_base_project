enum RequestMethod {
  getMethod,
  postMethod,
  putMethod,
}

class RequestModel {
  final RequestMethod method;
  final String route;
  final String params;
  RequestModel(this.route, this.method, this.params);
}
