import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raparva_app/data/services/join_now_service.dart';

class MembershipState {
  final int step; // 0: mobile, 1: otp, 2: success
  final String? mobile;
  final bool isLoading;
  final String? errorMessage;
  final Map<String, dynamic>? apiResponse;

  MembershipState({
    this.step = 0,
    this.mobile,
    this.isLoading = false,
    this.errorMessage,
    this.apiResponse,
  });

  MembershipState copyWith({
    int? step,
    String? mobile,
    bool? isLoading,
    String? errorMessage,
    Map<String, dynamic>? apiResponse,
  }) {
    return MembershipState(
      step: step ?? this.step,
      mobile: mobile ?? this.mobile,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      apiResponse: apiResponse ?? this.apiResponse,
    );
  }
}

class MembershipNotifier extends StateNotifier<MembershipState> {
  final MembershipApiService _apiService = MembershipApiService();

  MembershipNotifier() : super(MembershipState());

  void updateMobile(String number, String countryCode) {
    state = state.copyWith(mobile: number);
  }

  Future<void> sendOtp(String fullPhone) async {
    print('📤 Sending OTP to: $fullPhone');
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final response = await _apiService.oneMinuteMembership(fullPhone);
      print('✅ OTP Sent Successfully: $response');

      // Check if response contains success key and true value
      if (response.containsKey('success') && response['success'] == true) {
        state = state.copyWith(isLoading: false, step: 1, apiResponse: response);
      } else {
        final errorMsg = response['message'] ?? 'Failed to send OTP';
        state = state.copyWith(isLoading: false, errorMessage: errorMsg);
      }
    } catch (e) {
      print('❌ OTP Sending Failed: $e');
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> validateOtp(String otp) async {
    if (state.mobile == null) {
      state = state.copyWith(errorMessage: 'Mobile number is missing.');
      return;
    }

    print('📥 Verifying OTP: $otp for ${state.mobile}');
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final response = await _apiService.validateOtpExistence(state.mobile!, otp);
      print('✅ OTP Verified: $response');

      // Similar check for success
      if (response.containsKey('success') && response['success'] == true) {
        state = state.copyWith(isLoading: false, step: 2, apiResponse: response);
      } else {
        final errorMsg = response['message'] ?? 'OTP verification failed';
        state = state.copyWith(isLoading: false, errorMessage: errorMsg);
      }
    } catch (e) {
      print('❌ OTP Verification Failed: $e');
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  void previousStep() {
    state = state.copyWith(step: 0, errorMessage: null, isLoading: false);
  }
}

final membershipProvider = StateNotifierProvider<MembershipNotifier, MembershipState>(
  (ref) => MembershipNotifier(),
);
