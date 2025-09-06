// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:raparva_app/core/constants/api_constants.dart';

// class ApiUtil {
//   /// Generic GET Request
//   static Future<dynamic> get(String? endpoint, {bool isFullUrl = false}) async {
//     if (endpoint == null || endpoint.trim().isEmpty) {
//       throw ArgumentError("GET endpoint cannot be null or empty");
//     }

//     final uri = isFullUrl
//         ? Uri.parse(endpoint)
//         : Uri.parse('${ApiConstants.baseUrl2}$endpoint');

//     print('📡 [GET] Request URL: $uri'); 

//     final response = await http.get(uri, headers: _headers());

//     return _handleResponse(response);
//   }

//   /// Generic POST Request with body
//   static Future<dynamic> post(
//     String? endpoint,
//     Map<String, dynamic> body, {
//     bool isFullUrl = false,
//   }) async {
//     if (endpoint == null || endpoint.trim().isEmpty) {
//       throw ArgumentError("POST endpoint cannot be null or empty");
//     }

//     final uri = isFullUrl
//         ? Uri.parse(endpoint)
//         : Uri.parse('${ApiConstants.baseUrl2}$endpoint');

//     print('📡 [POST] Request URL: $uri');
//     print('📦 [POST] Body: ${jsonEncode(body)}');

//     final response = await http.post(
//       uri,
//       headers: _headers(),
//       body: jsonEncode(body),
//     );

//     return _handleResponse(response);
//   }

//   /// Common Headers
//   static Map<String, String> _headers() {
//     return {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//     };
//   }

//   /// Response Handler
//   static dynamic _handleResponse(http.Response response) {
//     final statusCode = response.statusCode;
//     final body = response.body;

//     print('📥 [RESPONSE] Status: $statusCode');
//     print('📥 [RESPONSE] Body: $body');

//     if (statusCode >= 200 && statusCode < 300) {
//       try {
//         return jsonDecode(body);
//       } catch (e) {
//         throw Exception('Failed to decode JSON: $e');
//       }
//     } else {
//       throw Exception('Error ${response.statusCode}: ${response.reasonPhrase}');
//     }
//   }
// }



import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiUtil {
  static bool enableLogging = true; // Toggle this in production

  static const Duration timeoutDuration = Duration(seconds: 15);

  /// Generic GET
  static Future<dynamic> get(String endpoint, {bool useRawUrl = false}) async {
    final uri = useRawUrl ? Uri.parse(endpoint) : Uri.parse(endpoint);

    _log('📡 [GET] Request: $uri');

    try {
      final response = await http.get(uri, headers: _headers()).timeout(timeoutDuration);
      return _handleResponse(response);
    } on TimeoutException {
      throw Exception('Request timed out after ${timeoutDuration.inSeconds} seconds');
    } on SocketException {
      throw Exception('No internet connection or network error');
    } catch (e) {
      throw Exception('GET request failed: $e');
    }
  }

  /// Generic POST
  static Future<dynamic> post(String endpoint, Map<String, dynamic> body, {bool useRawUrl = false}) async {
    final uri = useRawUrl ? Uri.parse(endpoint) : Uri.parse(endpoint);

    _log('📡 [POST] Request: $uri');
    _log('📦 Body: ${jsonEncode(body)}');

    try {
      final response = await http.post(uri, headers: _headers(), body: jsonEncode(body)).timeout(timeoutDuration);
      return _handleResponse(response);
    } on TimeoutException {
      throw Exception('Request timed out after ${timeoutDuration.inSeconds} seconds');
    } on SocketException {
      throw Exception('No internet connection or network error');
    } catch (e) {
      throw Exception('POST request failed: $e');
    }
  }

  /// Headers
  static Map<String, String> _headers() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  /// Handle response
  static dynamic _handleResponse(http.Response response) {
    final statusCode = response.statusCode;
    final body = response.body;

    _log('📥 [RESPONSE] Status: $statusCode');
    _log('📥 Body: $body');

    if (statusCode >= 200 && statusCode < 300) {
      try {
        return jsonDecode(body);
      } catch (e) {
        throw Exception('Invalid JSON format: $e');
      }
    } else {
      throw Exception('API Error $statusCode: ${response.reasonPhrase}');
    }
  }

  /// Conditional logging
  static void _log(String message) {
    if (enableLogging) {
      print(message);
    }
  }
}
