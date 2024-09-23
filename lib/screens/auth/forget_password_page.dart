import 'package:flutter/material.dart';

import '../../widgets/auth/custom_button.dart';
import '../../widgets/auth/custom_textField.dart';
import '../home_screen.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            const Text(
              'Please enter your email!',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20.0),
            const CustomTextField(
              borderColor: Color(0xff99BA60),
              fillColor: Color(0xffe7e7e7),
              label: 'Enter Your Email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 40.0),
            CustomButton(
              height: 50.0,
              fontSize: 20.0,
              backgroundColor: const Color(0xff99BA60),
              textColor: Colors.white,
              label: 'Send verification code',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
