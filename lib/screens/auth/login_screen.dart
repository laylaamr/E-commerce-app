import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../widgets/auth/login/login_footer.dart';
import '../../widgets/auth/login/login_form.dart';
import '../../widgets/auth/login/login_header.dart';
import '../../widgets/auth/terms_and_conditions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              "assets/onboarding_images/quickmart.png",
              height: 50,
            ),
          ),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginHeader(),
              LoginForm(),
              LoginFooter(),
            ],
          ),
        ),
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.all(12.0),
          child: TermsAndConditions(),
        ),
      ),
    );
  }
}
