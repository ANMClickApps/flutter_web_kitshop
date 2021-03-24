import 'package:flutter/material.dart';
import 'package:flutter_web_kitshop/pages/components_sign_up/desktop_navbar.dart';
import 'package:flutter_web_kitshop/pages/components_sign_up/mobile_navbar.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        if (constrains.maxWidth > 1200) {
          return DesktopNavBar();
        } else if (constrains.maxWidth > 800 && constrains.maxWidth < 1200) {
          return DesktopNavBar();
        } else {
          return MobileNavBar();
        }
      },
    );
  }
}
