import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:raparva_app/core/constants/app_color.dart';
import 'package:raparva_app/provider/join_now_provider.dart';

class JoinNowScreen extends ConsumerStatefulWidget {
  const JoinNowScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<JoinNowScreen> createState() => _JoinNowScreenState();
}

class _JoinNowScreenState extends ConsumerState<JoinNowScreen> {
  final TextEditingController otpController = TextEditingController();
  String selectedCountryCode = '+977';
  bool isAgreed = false;

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final membership = ref.watch(membershipProvider);
    final membershipNotifier = ref.read(membershipProvider.notifier);

    Widget content;

    switch (membership.step) {
      case 0:
        content = _buildMobileInputStep(membershipNotifier, membership);
        break;
      case 1:
        content = _buildOtpInputStep(membershipNotifier, membership);
        break;
      case 2:
        content = _buildSuccessStep(membership);
        break;
      default:
        content = const Center(child: Text('Unknown step'));
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [themered, Colors.purple, themeblue],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: themewhite,
                        size: 24,
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        'Join Now',
                        style: TextStyle(
                          color: themewhite,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 40), // To balance back icon space
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      bottom: 110.0,
                      top: 0.0, // Reduced top padding to move box up
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: content,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileInputStep(
    MembershipNotifier notifier,
    MembershipState state,
  ) {
    return Container(
      margin: const EdgeInsets.only(top: 8), // Added top margin to shift white box up a bit
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Image.asset(
              'assets/images/app_logo.png',
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 0),
          const Text(
            'Give a missed call on 09876543\nand become a part of the RPP.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 35),
          IntlPhoneField(
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 10,
              ),
            ),
            initialCountryCode: 'NP',
            onChanged: (phone) {
              notifier.updateMobile(phone.number, phone.countryCode);
              setState(() {
                selectedCountryCode = phone.countryCode;
              });
            },
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Checkbox(
                value: isAgreed,
                onChanged: (value) {
                  setState(() {
                    isAgreed = value ?? false;
                  });
                },
              ),
              const Expanded(
                child: Text(
                  'I agree that the information provided is correct.',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed:
                  (state.mobile != null &&
                          state.mobile!.length >= 7 &&
                          isAgreed &&
                          !state.isLoading)
                      ? () => notifier.sendOtp(
                        '$selectedCountryCode${state.mobile!}',
                      )
                      : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: themered,
                foregroundColor: themewhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child:
                  state.isLoading
                      ? const CircularProgressIndicator(
                        strokeWidth: 2,
                        color: themewhite,
                      )
                      : const Text('Send OTP'),
            ),
          ),
          if (state.errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                state.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildOtpInputStep(
    MembershipNotifier notifier,
    MembershipState state,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '🔒 Enter OTP',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: otpController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            hintText: 'One Time Password',
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton.icon(
            onPressed:
                state.isLoading
                    ? null
                    : () {
                      notifier.validateOtp(otpController.text.trim());
                    },
            style: ElevatedButton.styleFrom(
              backgroundColor: themeblue,
              foregroundColor: themewhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: const Icon(Icons.verified),
            label:
                state.isLoading
                    ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: themewhite,
                      ),
                    )
                    : const Text('Verify OTP'),
          ),
        ),
        TextButton(
          onPressed: () => notifier.previousStep(),
          style: TextButton.styleFrom(
            foregroundColor: Colors.white, // Text color white
          ),
          child: const Text('Change Mobile Number'),
        ),
        if (state.errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              state.errorMessage!,
              style: const TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }

  Widget _buildSuccessStep(MembershipState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.check_circle, color: themeblue, size: 64),
        const SizedBox(height: 20),
        Text(
          state.apiResponse?['message'] ?? 'You have successfully joined!',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: themeblue,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton.icon(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: themeblue,
              foregroundColor: themewhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: const Icon(Icons.check),
            label: const Text('Close'),
          ),
        ),
      ],
    );
  }
}
