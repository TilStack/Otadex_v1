import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/l10n/app_strings.dart';
import '../../../../core/providers/user_profile_provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/otadex_theme.dart';

class EditProfileSheet extends ConsumerStatefulWidget {
  const EditProfileSheet({super.key});

  @override
  ConsumerState<EditProfileSheet> createState() => _EditProfileSheetState();
}

class _EditProfileSheetState extends ConsumerState<EditProfileSheet> {
  late final TextEditingController _pseudoCtrl;
  late final TextEditingController _bioCtrl;
  String? _pseudoError;

  @override
  void initState() {
    super.initState();
    final p = ref.read(userProfileProvider);
    _pseudoCtrl = TextEditingController(text: p.pseudo);
    _bioCtrl = TextEditingController(text: p.bio);
  }

  @override
  void dispose() {
    _pseudoCtrl.dispose();
    _bioCtrl.dispose();
    super.dispose();
  }

  void _save() {
    final pseudo = _pseudoCtrl.text.trim();
    final s = AppStrings.of(context);
    if (pseudo.length < 3) {
      setState(() => _pseudoError = s.pseudoMinLength);
      return;
    }
    ref.read(userProfileProvider.notifier).updateProfile(
          pseudo: pseudo,
          bio: _bioCtrl.text.trim(),
        );
    Navigator.pop(context);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(s.profileUpdated)));
  }

  @override
  Widget build(BuildContext context) {
    final theme = OtadexTheme.of(context);
    final s = AppStrings.of(context);

    InputDecoration inputDeco({String? errorText}) => InputDecoration(
          filled: true,
          fillColor: theme.backgroundElevated,
          errorText: errorText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: theme.borderSubtle),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: theme.borderSubtle),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: theme.accentColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.error),
          ),
        );

    return Container(
      decoration: BoxDecoration(
        color: theme.backgroundCard,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border(top: BorderSide(color: theme.borderSubtle)),
      ),
      padding: EdgeInsets.fromLTRB(
          24, 16, 24, MediaQuery.of(context).viewInsets.bottom + 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.borderDefault,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              s.editProfile,
              style: GoogleFonts.rajdhani(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: theme.textPrimary,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(s.pseudoLabel,
              style:
                  GoogleFonts.nunitoSans(fontSize: 12, color: theme.textSecondary)),
          const SizedBox(height: 6),
          TextField(
            controller: _pseudoCtrl,
            style: GoogleFonts.nunitoSans(color: theme.textPrimary),
            decoration: inputDeco(errorText: _pseudoError),
            onChanged: (_) {
              if (_pseudoError != null) setState(() => _pseudoError = null);
            },
          ),
          const SizedBox(height: 16),
          Text(s.bioLabel,
              style:
                  GoogleFonts.nunitoSans(fontSize: 12, color: theme.textSecondary)),
          const SizedBox(height: 6),
          TextField(
            controller: _bioCtrl,
            maxLines: 3,
            style: GoogleFonts.nunitoSans(color: theme.textPrimary),
            decoration: inputDeco(),
          ),
          const SizedBox(height: 24),
          Row(children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: theme.textSecondary,
                  side: BorderSide(color: theme.borderDefault),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(s.cancel,
                    style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w600)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: _save,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.accentColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(s.saveChanges,
                    style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w700)),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
