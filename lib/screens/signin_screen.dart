// lib/screens/signin_screen.dart
import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/home_screen.dart'; // استيراد HomeScreen
import '../fade_route.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _validateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      // إذا كانت البيانات صحيحة، نعرض Dialog النجاح
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('تم تسجيل الدخول'),
            content: const Text('تم تسجيل الدخول بنجاح.'),
            actions: [
              TextButton(
                onPressed: () {
  Navigator.of(context).pop(); // يغلق الـ Dialog
  // استخدام الانتقال المخصص بدلاً من الانتقال العادي
  Navigator.of(context).pushReplacement(
    FadePageRoute(page: HomeScreen()), // الانتقال إلى HomeScreen مع تأثير Fade
  );
},
                child: const Text('إغلاق'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل الدخول' , style: TextStyle(color: Colors.white),),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'البريد الإلكتروني',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'رجاءً أدخل بريدًا إلكترونيًا صالحًا';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'كلمة المرور',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _validateAndSubmit,
                child: const Text('تسجيل الدخول'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}