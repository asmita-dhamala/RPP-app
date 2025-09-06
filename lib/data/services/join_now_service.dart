import 'dart:convert';
import 'package:http/http.dart' as http; // used for low-level Response type in _handleResponse
import 'package:raparva_app/core/constants/api_constants.dart';
import 'package:raparva_app/core/utils/api_util.dart'; // your ApiUtil wrapper class
import 'package:raparva_app/data/models/join_now_model.dart';

class MembershipApiService {
  /// Changed this to accept `http.Response` and decode JSON once,
  /// throwing detailed exception on error response.
  Future<Map<String, dynamic>> _handleResponse(http.Response response) async {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      // Decode error message if available and include in thrown Exception
      final errorBody = json.decode(response.body);
      final errorMessage = errorBody['message'] ?? 'An unknown error occurred.';
      throw Exception('API call failed with status ${response.statusCode}: $errorMessage');
    }
  }



  /// Calls the one-minute-membership API
  Future<Map<String, dynamic>> oneMinuteMembership(String mobile) async {
    // Added isFullUrl true if ApiConstants.oneMinuteMembership is full URL
    final response = await ApiUtil.post(ApiConstants.oneMinuteMembership, {'mobile': mobile}, useRawUrl: true);
    return _handleResponse(response);
  }

  /// Fetches forms data
  Future<Map<String, dynamic>> getForms() async {
    final response = await ApiUtil.get(ApiConstants.forms, useRawUrl: true);
    return _handleResponse(response);
  }

  /// Registers general members
  Future<Map<String, dynamic>> registerGeneralMembers(Map<String, String> data) async {
    final response = await ApiUtil.post(ApiConstants.registerGeneralMembers, data, useRawUrl: true);
    return _handleResponse(response);
  }

  /// Registers active members
  Future<Map<String, dynamic>> registerActiveMembers(Map<String, String> data) async {
    final response = await ApiUtil.post(ApiConstants.registerActiveMembers, data, useRawUrl: true);
    return _handleResponse(response);
  }

  /// Validates OTP existence
  Future<Map<String, dynamic>> validateOtpExistence(String identity, String otpCode) async {
    final uri = '${ApiConstants.validateOtpExistence}?identity=$identity&otp_code=$otpCode';
    final response = await ApiUtil.get(uri, useRawUrl: true);
    return _handleResponse(response);
  }

  /// Gets member details by ID, mobile, or email
  Future<Member> getMemberByIdMobileEmail(String identifier) async {
    final uri = '${ApiConstants.getMemberByIdMobileEmail}/$identifier';
    final response = await ApiUtil.get(uri, useRawUrl: true);
    final jsonResponse = await _handleResponse(response);
    if (jsonResponse['success'] == true && jsonResponse['data'] != null) {
      return Member.fromJson(jsonResponse['data']);
    } else {
      throw Exception('Failed to load member details: ${jsonResponse['message'] ?? 'No data'}');
    }
  }

  /// Validates OTP and sets a new password
  Future<Map<String, dynamic>> validateOtpSetNewPassword(String email, String otpCode, String password) async {
    final uri = ApiConstants.validateOtpSetNewPassword;
    final response = await ApiUtil.post(uri, {
      'email': email,
      'otp_code': otpCode,
      'password': password,
    }, useRawUrl: true);
    return _handleResponse(response);
  }

  /// Renews membership
  Future<Map<String, dynamic>> renewMembership(String id, String membershipDuration) async {
    final uri = ApiConstants.renewMembership;
    final response = await ApiUtil.post(uri, {
      'id': id,
      'membership_duration': membershipDuration,
    }, useRawUrl: true);
    return _handleResponse(response);
  }

  /// Gets payment status by ID
  Future<Map<String, dynamic>> getPaymentStatus(String id) async {
    final uri = '${ApiConstants.paymentStatus}/$id';
    final response = await ApiUtil.get(uri, useRawUrl: true);
    return _handleResponse(response);
  }
}
