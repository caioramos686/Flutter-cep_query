import 'package:flutter/material.dart';
import 'package:volus_app/imports.dart';

// ignore: must_be_immutable
class CommonButton extends StatelessWidget {
  Function() onTap;
  final String text;

  CommonButton({
    super.key,
    required this.onTap,
    required this.text,

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(800),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        decoration: const BoxDecoration(
          color: AppColors.pinkColor,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
