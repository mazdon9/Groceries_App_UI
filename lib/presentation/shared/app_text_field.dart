import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/theme/app_color_schemes.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final bool obscureText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;

  const AppTextField({
    super.key,
    required this.label,
    this.hint,
    this.obscureText = false,
    this.controller,
    this.suffixIcon,
    this.keyboardType,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: suffixIcon,
            border: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColorSchemes.green, width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }
}
