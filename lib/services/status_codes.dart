class StatusCodes {
  static const int success = 200;
  static const int badRequst = 400;
  static const int unauthorisedAccess = 401;
  static const int apiNotFound = 404;
  static const int serveerError = 500;

  static String getMessage(int statusCode) {
    switch (statusCode) {
      case success:
        return 'Request was successful';
      case badRequst:
        return 'Bad request Please check the API request';
      case unauthorisedAccess:
        return 'Unauthorized Please check your credentials';
      case apiNotFound:
        return 'Not found the requested resource could not be found';
      case serveerError:
        return 'Server error There is an issue with the server';
      default:
        return 'Unexpected error $statusCode';
    }
  }
}