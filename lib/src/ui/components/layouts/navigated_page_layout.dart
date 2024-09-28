import 'package:flutter/material.dart';
import 'package:flutter_starter_project/src/ui/components/app_bar/app_bar.dart';

class NavigatedPageLayout extends StatelessWidget {
  const NavigatedPageLayout({
    required this.child,
    required this.title,
    this.onNavigate,
    super.key,
  });

  final Widget child;
  final VoidCallback? onNavigate;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        onActionIconNavigate: onNavigate,
      ),
      body: child,
    );
  }
}
