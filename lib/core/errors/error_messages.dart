class AppErrorMessages {
  static const Map<String, dynamic> statusCodesTranslator = {
    '400': 'Bad request data. Please try again.',
    '401': 'Unauthorized request. Please log in.',
    '403': 'Request forbidden by the server. Please try again.',
    '404': 'Requested address not found. Please try again.',
    '405': 'Internal server error. Please try again later.',
    '409': 'Conflict error. Please try again later.',
    '422': 'Unprocessable request. Please check your input and try again.',
    '500': 'Internal server error. Please try again later.',
  };
}
