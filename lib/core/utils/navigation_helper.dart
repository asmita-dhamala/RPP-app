import 'package:flutter/material.dart';
import 'package:raparva_app/routing/app_routes.dart';

void navigateToTab(BuildContext context, String tappedTab, String currentTab) {
  if (tappedTab == currentTab) {
    // Do nothing if the user taps the active tab
    return;
  }

  String route = '/'; // default route fallback

  switch (tappedTab) {
    case 'home':
      route = Routes.home;
      break;
    case 'video':
      route = '/video';  // make sure this route is defined in your Routes
      break;
    case 'my_rpp':
      route = '/my_rpp'; // define this route too
      break;
    case 'rpp_live':
      route = '/rpp_live'; // define this route too
      break;
    case 'share':
      // You can add any logic here if you want a special action on share
      return;
  }

  Navigator.pushReplacementNamed(context, route);
}
