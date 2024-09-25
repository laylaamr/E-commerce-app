import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/main_screen.dart';

class AuthProvider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isLoading = false;

  Dio dio = Dio();
  final String apiUrl = 'https://fakestoreapi.com/auth/login';

  String? validateName(String? value) {
    return value?.isEmpty ?? true ? 'Please enter your full name' : null;
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  String? validateEmail(String? value) {
    return value?.isEmpty ?? true ? 'Please enter your username' : null;
  }

  String? validatePassword(String? value) {
    if (value?.isEmpty ?? true) return 'Please enter your password';
    if (value!.length < 6) return 'Password must be at least 6 characters long';
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value?.isEmpty ?? true) return 'Please confirm your password';
    if (value != passwordController.text) return 'Passwords do not match';
    return null;
  }

  Future<void> login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    isLoading = true;
    notifyListeners();

    try {
      Response response = await dio.post(apiUrl, data: {
        'username': emailController.text,
        'password': passwordController.text,
      });

      final token = response.data['token'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    } catch (e) {
      showErrorDialog(context, 'Login failed. Please check your credentials.');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Okay'),
          ),
        ],
      ),
    );
  }

  bool submitForm(BuildContext context) => formKey.currentState!.validate();
}
