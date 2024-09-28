import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.onActionIconNavigate});

  final String title;
  final VoidCallback? onActionIconNavigate;


  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: false,
      actions: [
        if (onActionIconNavigate != null)
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: onActionIconNavigate,
          ),
      ],
    );
  }
}
