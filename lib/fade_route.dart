// lib/fade_route.dart
import 'package:flutter/material.dart';

// هذا Class مخصص لإنشاء تأثير Fade In/Out عند الانتقال بين الصفحات
class FadePageRoute extends PageRouteBuilder {
  final Widget page;

  FadePageRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            // تحكم في شفافية الصفحة بناءً على قيمة animation
            opacity: animation,
            child: child,
          ),
          transitionDuration: const Duration(milliseconds: 600), // مدة الانتقال
        );
}