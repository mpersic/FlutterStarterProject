import 'package:flutter/material.dart';

/// Fade transition builder
PageRouteBuilder<T> fadeTransition<T>(Widget page) {
  return PageRouteBuilder<T>(
    pageBuilder: (context, animation, secondaryAnimation) {
      const begin = 0.0;
      const end = 1.0;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var opacityAnimation = animation.drive(tween);
      return FadeTransition(opacity: opacityAnimation, child: page);
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

/// Slide transition builder
PageRouteBuilder<T> slideTransition<T>(Widget page) {
  return PageRouteBuilder<T>(
    pageBuilder: (context, animation, secondaryAnimation) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      var fadeAnimation = animation.drive(Tween(begin: 0.0, end: 1.0));
      return SlideTransition(
        position: offsetAnimation,
        child: FadeTransition(opacity: fadeAnimation, child: page),
      );
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
