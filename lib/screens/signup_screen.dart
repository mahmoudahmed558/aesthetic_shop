// lib/screens/signup_screen.dart
import 'package:flutter/material.dart';
import '../constants.dart'; // لاستخدام الألوان
// سنستورد ملف dialog لاحقًا
import '../screens/home_screen.dart'; // استيراد HomeScreen
import '../fade_route.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // controllers لإدارة حقول النص والحصول على قيمها
  final _formKey = GlobalKey<FormState>(); // مفتاح للتحكم في حالة النموذج والتحقق منه
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // دالة للتحقق من صحة البيانات وإظهار Dialog عند النجاح
  void _validateAndSubmit() {
    // .validate() تستدعي دالة التحقق Validator في كل حقل
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('نجح التسجيل'),
            content: const Text('تم إنشاء الحساب بنجاح.'),
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

  // دالة مساعدة للتحقق من أن الحرف الأول كبير (للاسم)
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال الاسم';
    }
    if (value[0] != value[0].toUpperCase()) {
      return 'يجب أن يبدأ الحرف الأول بحرف كبير';
    }
    return null; // يعني لا يوجد خطأ
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إنشاء حساب جديد' , style: TextStyle(color: Colors.white),),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // ربط النموذج بالمفتاح
          child: SingleChildScrollView(
            // لمنع overflow عند ظهور لوحة المفاتيح
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'الاسم الكامل',
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateName, // ربط دالة التحقق
                ),
                const SizedBox(height: 16),
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
                  obscureText: true, // لإخفاء النص
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
                const SizedBox(height: 16),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'تأكيد كلمة المرور',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'كلمة المرور غير متطابقة';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _validateAndSubmit, // استدعاء الدالة عند الضغط
                  child: const Text('إنشاء الحساب'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // مهم جدًا: التخلص من الـ controllers لتجنب تسرب الذاكرة
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}