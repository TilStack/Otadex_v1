import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/l10n/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/otadex_button.dart';

class SlideTwoContent extends StatefulWidget {
  final VoidCallback? onNext;

  const SlideTwoContent({super.key, this.onNext});

  @override
  State<SlideTwoContent> createState() => _SlideTwoContentState();
}

class _SlideTwoContentState extends State<SlideTwoContent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _floatController;
  late final Animation<double> _floatY;
  late final Animation<double> _floatScale;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3200),
    )..repeat(reverse: true);

    _floatY = Tween<double>(begin: -10.0, end: 10.0).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );

    _floatScale = Tween<double>(begin: 1.0, end: 1.03).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final s = AppStrings.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ── Floating illustration ──
        AnimatedBuilder(
          animation: _floatController,
          builder: (context, child) => Transform.translate(
            offset: Offset(0, _floatY.value),
            child: Transform.scale(
              scale: _floatScale.value,
              child: child,
            ),
          ),
          child: SizedBox(
            height: size.height * 0.52,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Radial glow behind image
                Container(
                  width: size.width * 0.90,
                  height: size.height * 0.44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.primary.withValues(alpha: 0.32),
                        AppColors.accent.withValues(alpha: 0.06),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.55, 1.0],
                    ),
                  ),
                ),
                Image.asset(
                  AppAssets.onboarding2,
                  height: size.height * 0.52,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        )
            .animate()
            .fadeIn(duration: 750.ms, delay: 150.ms)
            .slideY(
              begin: 0.10,
              end: 0,
              duration: 800.ms,
              delay: 150.ms,
              curve: Curves.easeOutCubic,
            )
            .scale(
              begin: const Offset(0.85, 0.85),
              end: const Offset(1.0, 1.0),
              duration: 800.ms,
              delay: 150.ms,
              curve: Curves.easeOutCubic,
            ),

        const SizedBox(height: AppSpacing.lg),

        // ── Text zone ──
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Column(
            children: [
              Text.rich(
                TextSpan(
                  style: GoogleFonts.rajdhani(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    height: 1.1,
                  ),
                  children: [
                    TextSpan(
                      text: '${s.slide2TitleExplore} ',
                      style: const TextStyle(color: AppColors.textPrimary),
                    ),
                    TextSpan(
                      text: s.slide2TitleCount,
                      style: const TextStyle(color: AppColors.accent),
                    ),
                    TextSpan(
                      text: '\n${s.slide2TitleCharacters}',
                      style: const TextStyle(color: AppColors.textPrimary),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(duration: 500.ms, delay: 450.ms)
                  .slideY(begin: 0.15, end: 0, duration: 500.ms, delay: 450.ms),

              const SizedBox(height: AppSpacing.sm),

              Text(
                s.slide2Subtitle,
                style: GoogleFonts.nunitoSans(
                  fontSize: 15,
                  color: AppColors.textSecondary,
                  height: 1.55,
                ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(duration: 500.ms, delay: 600.ms),

              const SizedBox(height: AppSpacing.xl),

              OtadexButton(
                label: s.slide2Button,
                onPressed: widget.onNext,
              )
                  .animate()
                  .fadeIn(duration: 400.ms, delay: 730.ms)
                  .slideY(begin: 0.12, end: 0, duration: 400.ms, delay: 730.ms),
            ],
          ),
        ),
      ],
    );
  }
}
