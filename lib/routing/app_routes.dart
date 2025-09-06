import 'package:flutter/material.dart';
import 'package:raparva_app/presentation/screens/home/all_navigation_bar/my_rpp.dart';
import 'package:raparva_app/presentation/screens/home/all_navigation_bar/rpp_live.dart';
import 'package:raparva_app/presentation/screens/home/all_navigation_bar/video.dart';
import 'package:raparva_app/presentation/screens/home/home_page.dart';
import 'package:raparva_app/presentation/screens/splash/splash_screen.dart';



class Routes {
  // 🔹 Core navigation
  static const String splash = '/splash';
  static const String home = '/home';
  static const String video = '/video';
  static const String myRpp = '/my_rpp';
  static const String rppLive = '/rpp_live';

  // 🔹 Info center routes
  static const String calender = '/calender';
  static const String notice = '/notice';
  static const String press = '/press';
  static const String documents = '/documents';
  // static const String photogallery = '/photogallery'; 

  static Route<dynamic> onGenerateRouted(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _buildRoute(const SplashScreen());
      case home:
        return _buildRoute(const HomePage());
      case video:
        return _buildRoute(const VideoPage());
      case myRpp:
        return _buildRoute(const MyRppPage());
      case rppLive:
        return _buildRoute(const RppLivePage());
      // case photogallery:
      //   return _buildRoute(GalleryListingPage());

      // ✅ Info center screen routes
      // case calender:
      //   return _buildRoute(const CalenderPage());
      // case notice:
      //   return _buildRoute(const NoticePage());
      // case press:
      //   return _buildRoute(const PressPage());
      // case documents:
      //   return _buildRoute(const DocumentsPage());

      default:
        return _unknownRoute(settings.name);
    }
  }

  static MaterialPageRoute _buildRoute(Widget child) {
    return MaterialPageRoute(
      builder: (context) => child,
    );
  }

  static MaterialPageRoute _unknownRoute(String? routeName) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Unknown Route")),
        body: Center(
          child: Text(
            "No route defined for '${routeName ?? 'unknown'}'",
            style: const TextStyle(fontSize: 18, color: Colors.red),
          ),
        ),
      ),
    );
  }
}

/// Helper to map tab keys to route names and navigate.
void navigateToTab(BuildContext context, String tabKey) {
  final tabRoutes = {
    'home': Routes.home,
    'video': Routes.video,
    'my_rpp': Routes.myRpp,
    'rpp_live': Routes.rppLive,
  };

  final routeName = tabRoutes[tabKey];
  if (routeName != null) {
    Navigator.pushNamed(context, routeName);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("No route found for tab '$tabKey'")),
    );
  }
}


// return _buildRoute(const OurParticipleScreen());