import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String? hintText;
  final TextInputType? type;
  final TextEditingController? controller;
  final bool? enabled;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.label,
    this.hintText,
    this.type,
    this.controller,
    this.enabled,
    this.suffixIcon,
    this.validator,
    this.focusNode,
    this.obscureText = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          obscureText: widget.obscureText,
          validator: widget.validator,
          focusNode: widget.focusNode,
          controller: widget.controller,
          enabled: widget.enabled,
          keyboardType: widget.type,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black54,
          ),
          decoration: InputDecoration(
            isDense: true,
            suffixIcon: widget.suffixIcon,
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
            contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(4),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(4),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF2F5C4A), width: 2),
              borderRadius: BorderRadius.circular(4),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(4),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ],
    );
  }
}
