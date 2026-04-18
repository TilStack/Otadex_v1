import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_spacing.dart';
import '../theme/otadex_theme.dart';

class OtadexTextField extends StatefulWidget {
  final String label;
  final String? hint;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;

  const OtadexTextField({
    super.key,
    required this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
  });

  @override
  State<OtadexTextField> createState() => _OtadexTextFieldState();
}

class _OtadexTextFieldState extends State<OtadexTextField> {
  bool _isFocused = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() => _isFocused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = OtadexTheme.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        boxShadow: _isFocused
            ? [
                BoxShadow(
                  color: theme.accentGlow,
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
              ]
            : [],
      ),
      child: TextFormField(
        controller: widget.controller,
        focusNode: _focusNode,
        obscureText: widget.obscureText,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        onChanged: widget.onChanged,
        cursorColor: theme.accentColor,
        style: GoogleFonts.nunitoSans(
          fontSize: 15,
          color: theme.textPrimary,
        ),
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hint,
          prefixIcon: widget.prefixIcon != null
              ? Icon(widget.prefixIcon, size: 20, color: theme.textSecondary)
              : null,
          suffixIcon: widget.suffixIcon,
        ),
      ),
    );
  }
}

class OtadexPasswordField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;

  const OtadexPasswordField({
    super.key,
    required this.label,
    this.controller,
    this.validator,
    this.textInputAction,
  });

  @override
  State<OtadexPasswordField> createState() => _OtadexPasswordFieldState();
}

class _OtadexPasswordFieldState extends State<OtadexPasswordField> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    final theme = OtadexTheme.of(context);
    return OtadexTextField(
      label: widget.label,
      prefixIcon: Icons.lock_outline,
      obscureText: !_visible,
      controller: widget.controller,
      validator: widget.validator,
      textInputAction: widget.textInputAction,
      suffixIcon: GestureDetector(
        onTap: () => setState(() => _visible = !_visible),
        child: Icon(
          _visible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          size: 20,
          color: theme.textSecondary,
        ),
      ),
    );
  }
}
