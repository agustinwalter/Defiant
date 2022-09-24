import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.small = false,
    this.isLoading = false,
  });

  final String text;
  final void Function() onPressed;
  final bool small;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: small ? 10 : 16,
          vertical: small ? 10 : 17,
        ),
        side: const BorderSide(width: 1.5, color: Color(0xFF54B964)),
        foregroundColor: const Color(0xFF54B964),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: isLoading
          ? const Padding(
              padding: EdgeInsets.symmetric(horizontal: 19),
              child: SizedBox(
                height: 16,
                width: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            )
          : Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
    );
  }
}
