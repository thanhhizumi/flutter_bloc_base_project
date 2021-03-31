class ApiError implements Exception {
  final String _message;
  final String _prefix;

  ApiError([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataError extends ApiError {
  FetchDataError([String message])
      : super(message, "Error During Communication: ");
}

class BadRequestErorr extends ApiError {
  BadRequestErorr([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedErorr extends ApiError {
  UnauthorisedErorr([message]) : super(message, "Unauthorised: ");
}

class InvalidInputErorr extends ApiError {
  InvalidInputErorr([String message]) : super(message, "Invalid Input: ");
}
