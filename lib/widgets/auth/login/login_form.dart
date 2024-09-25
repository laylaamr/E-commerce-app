import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/utils/constants.dart';
import 'package:untitled1/widgets/auth/custom_button.dart';
import 'package:untitled1/widgets/auth/custom_textField.dart';

import '../../../providers/auth_provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      return Form(
        key: authProvider.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              borderColor: kPrimaryColor,
              label: 'Username',
              keyboardType: TextInputType.emailAddress,
              controller: authProvider.emailController,
              validator: authProvider.validateEmail,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              borderColor: kPrimaryColor,
              label: 'Password',
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              controller: authProvider.passwordController,
              validator: authProvider.validatePassword,
            ),
            const SizedBox(height: 25.0),
            CustomButton(
              onTap: () {
                authProvider.login(context);
              },
              label: authProvider.isLoading ? 'Logging in...' : 'Login',
              backgroundColor: Colors.black,
              textColor: Colors.white,
            ),
          ],
        ),
      );
    });
  }
}
