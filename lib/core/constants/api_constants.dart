class ApiConstants {
  // Use the local URL for development, switch to live for production.
  // Make sure your local server (127.0.0.1:8001) is running and accessible.
  static const String _baseUrl = 'https://membership.rpp.org.np/api/';
  static const String baseUrl2 = 'https://rpp.org.np';

  // Membership Endpoints
  static String get oneMinuteMembership => '${_baseUrl}one-minute-membership';
  static String get forms => '${_baseUrl}forms';
  static String get registerGeneralMembers =>
      '${_baseUrl}register-general-members';
  static String get registerActiveMembers =>
      '${_baseUrl}register-active-members';
  static String get validateOtpExistence => '${_baseUrl}validate-otp-existence';
  static String get updatePaymentStatus => '${_baseUrl}update-payment-status';
  static String get getMemberByIdMobileEmail =>
      '${_baseUrl}get-member-by-id-mobile-email';
  static String get validateOtpSetNewPassword =>
      '${_baseUrl}validate-otp-set-new-password';
  static String get renewMembership => '${_baseUrl}renew-membership';
  static String get paymentStatus => '${_baseUrl}payment-status';

  static String get homePage => '$baseUrl2/api/home-page/';
  static String get swipperSlider => '$baseUrl2/api/home-page/';
  static String get photoGallery => '$baseUrl2/api/news?cat_id=10';
  static String get videoGallery => '$baseUrl2/api/news?cat_id=9';
  static String get pressRelease => '$baseUrl2/api/news?cat_id=6';
  static String get news => '$baseUrl2/api/news?cat_id=7';
  static String get information => '$baseUrl2/api/news?cat_id=8';

  static String get history => '$baseUrl2/api/news?cat_id=19';
  static String get thoughts => '$baseUrl2/api/news?cat_id=13';
  static String get upcomingEvents => '$baseUrl2/api/news?cat_id=12';

// static String get articles => '$baseUrl2/api/articles';
}





// class ApiConstants {
//   // Base URLs
//   static const String membershipBaseUrl = 'https://membership.rpp.org.np/api';
//   static const String mainBaseUrl = 'https://rpp.org.np/api';

//   // Membership endpoints
//   static String get oneMinuteMembership => '$membershipBaseUrl/one-minute-membership';
//   static String get forms => '$membershipBaseUrl/forms';
//   static String get registerGeneralMembers => '$membershipBaseUrl/register-general-members';
//   static String get registerActiveMembers => '$membershipBaseUrl/register-active-members';
//   static String get validateOtpExistence => '$membershipBaseUrl/validate-otp-existence';
//   static String get updatePaymentStatus => '$membershipBaseUrl/update-payment-status';
//   static String get getMemberByIdMobileEmail => '$membershipBaseUrl/get-member-by-id-mobile-email';
//   static String get validateOtpSetNewPassword => '$membershipBaseUrl/validate-otp-set-new-password';
//   static String get renewMembership => '$membershipBaseUrl/renew-membership';
//   static String get paymentStatus => '$membershipBaseUrl/payment-status';

//   // Website (public) endpoints
//   static String get homePage => '$mainBaseUrl/home-page/';
//   static String get swipperSlider => '$mainBaseUrl/home-page/';
//   static String get photoGallery => '$mainBaseUrl/news?cat_id=10';
//   static String get videoGallery => '$mainBaseUrl/news?cat_id=9';
//   static String get pressRelease => '$mainBaseUrl/news?cat_id=6';
//   static String get news => '$mainBaseUrl/news?cat_id=7';
//   static String get information => '$mainBaseUrl/news?cat_id=8';
//   static String get history => '$mainBaseUrl/news?cat_id=19';
//   static String get thoughts => '$mainBaseUrl/news?cat_id=13';
//   static String get upcomingEvents => '$mainBaseUrl/news?cat_id=12';
// }
