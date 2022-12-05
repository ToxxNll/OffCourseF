import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:offcourse/pages/authentification/login_page.dart';
import 'package:offcourse/pages/authentification/sign_up.dart';

class RegLog extends StatefulWidget {
  const RegLog({super.key});

  @override
  State<RegLog> createState() => _RegLogState();
}

class _RegLogState extends State<RegLog> {
  bool showLogin = true;

  void toggleScreens() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginPage(showReg: toggleScreens);
    } else {
      return SignUpPage(showLogin: toggleScreens);
    }
  }
}
