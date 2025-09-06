class ApiHelper {
  /// Returns user-friendly error message for common HTTP status codes.
  static String getErrorMessage(int statusCode) {
    switch (statusCode) {
      case 400:
        return "Bad Request";
      case 401:
        return "Unauthorized";
      case 403:
        return "Forbidden";
      case 404:
        return "Not Found";
      case 500:
        return "Internal Server Error";
      default:
        return "Something went wrong (Status: $statusCode)";
    }
  }
}

String getSliderThumbUrl(int? id) {
  if (id == null || id == 0) {
    return 'https://rpp.org.np/assets/images/no-image.png'; // ✅ Placeholder
  }
  return 'https://rpp.org.np/media/preview/$id/thumb';
}
