import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;

  const AppBarCustom({super.key, required this.title, this.backgroundColor});

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 6.0, right: 6.0),
      child: AppBar(
        shadowColor: Colors.transparent,
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 19.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontFamily: 'Inter',
            ),
          ),
        ),
        backgroundColor: backgroundColor ?? Colors.white,
        centerTitle: true,
      ),
    );
  }
}
