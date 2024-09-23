import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/utils/constants.dart';
import 'package:untitled1/widgets/auth/custom_button.dart';
import 'package:untitled1/widgets/auth/custom_textField.dart';

import '../../../providers/auth_provider.dart';
import '../../../screens/auth/confirmed_page.dart';
import '../../../screens/main_screen.dart';

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
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
              validator: authProvider.validateEmail,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              borderColor: kPrimaryColor,
              label: 'Password',
              obscureText: !authProvider.isPasswordVisible,
              icon: IconButton(
                icon: Icon(
                  authProvider.isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: const Color(0xff717171),
                ),
                onPressed: authProvider.togglePasswordVisibility,
              ),
              validator: authProvider.validatePassword,
            ),
            const SizedBox(height: 15.0),
            const Align(
              alignment: Alignment.centerRight,
              child: Text("Forgot password?",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor)),
            ),
            const SizedBox(height: 25.0),
            CustomButton(
              onTap: () {
                if (authProvider.submitForm(context)) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ConfirmedPage(
                        textOne: 'The account has been',
                        textTwo: 'logged in successfully',
                        textThree: 'Welcome back!',
                        navigateTo: MainScreen(),
                        buttonText: 'Continue',
                      ),
                    ),
                  );
                }
              },
              label: 'Login',
              height: 50,
              fontSize: 20,
              backgroundColor: Colors.black,
              textColor: Colors.white,
            ),
          ],
        ),
      );
    });
  }
}
