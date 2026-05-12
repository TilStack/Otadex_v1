import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/l10n/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/otadex_theme.dart';
import '../../../../core/widgets/subscription_feature_item.dart';
import '../../profile/presentation/widgets/plan_card.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

enum BillingCycle { monthly, annual }

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final BillingCycle _billingCycle = BillingCycle.monthly;
  final TextEditingController _licenseController = TextEditingController();

  @override
  void dispose() {
    _licenseController.dispose();
    super.dispose();
  }

  void _showLicenseDialog() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tu as déjà une licence ?'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _licenseController,
              decoration: const InputDecoration(
                labelText: 'Code de licence',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Code de licence soumis. La vérification sera disponible prochainement.',
                  ),
                ),
              );
            },
            child: const Text('Valider'),
          ),
        ],
      ),
    );
  }

  void _showPurchaseDialog(String planName) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Passer au plan $planName'),
        content: const Text(
          'La gestion de l\'abonnement sera bientôt connectée au paiement réel.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  bool get _isAnnual => _billingCycle == BillingCycle.annual;

  @override
  Widget build(BuildContext context) {
    final theme = OtadexTheme.of(context);
    final s = AppStrings.of(context);
    final joninPrice = _isAnnual ? s.joninAnnualPrice : s.joninMonthlyPrice;
    final kagePrice = _isAnnual ? s.kageAnnualPrice : s.kageMonthlyPrice;
    return Scaffold(
      backgroundColor: AppColors.backgroundDeep,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(s.manageSubscription),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              s.subscriptionObtainPass,
              style: GoogleFonts.rajdhani(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: theme.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              s.subscriptionRankUpgradeDesc,
              style: GoogleFonts.nunitoSans(
                fontSize: 14,
                color: theme.textSecondary,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 24),
            PlanCard(
              name: 'Genin',
              tag: s.currentPlanTag,
              tagColor: AppColors.success,
              price: '0 FCFA',
              priceColor: theme.textPrimary,
              features: [
                (true, s.sheetsNavigation),
                (true, s.likesComments),
                (false, s.adsShown),
                (false, s.aiDisabled),
              ],
              buttonLabel: s.planActualButton,
              buttonEnabled: false,
              borderColor: AppColors.success.withValues(alpha: 0.4),
              isCta: false,
            ),
            const SizedBox(height: 16),
            PlanCard(
              name: 'Jonin',
              tag: null,
              tagColor: AppColors.rankJonin,
              price: joninPrice,
              priceColor: AppColors.rankJonin,
              features: [
                (true, s.unlimitedCollection),
                (true, s.noAds),
                (true, s.aiChatbot),
                (true, s.joninBadge),
              ],
              buttonLabel: s.upgradeToJoninButton,
              buttonEnabled: true,
              borderColor: AppColors.rankJonin,
              isCta: true,
              onUpgrade: () => _showPurchaseDialog('Jonin'),
            ),
            const SizedBox(height: 16),
            PlanCard(
              name: 'Kage',
              tag: null,
              tagColor: AppColors.rankKage,
              price: kagePrice,
              priceColor: AppColors.rankKage,
              features: [
                (true, s.joninIncluded),
                (true, s.aiImageGen),
                (true, s.noWatermark),
                (true, s.exclusiveThemes),
              ],
              buttonLabel: s.upgradeToKageButton,
              buttonEnabled: true,
              borderColor: AppColors.rankKage,
              isCta: true,
              onUpgrade: () => _showPurchaseDialog('Kage'),
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  s.subscriptionAlreadyLicense,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: theme.textPrimary,
                  ),
                ),
                TextButton(
                  onPressed: _showLicenseDialog,
                  child: Text(
                    'Entrer le code',
                    style: GoogleFonts.nunitoSans(
                      color: AppColors.rankJonin,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              s.subscriptionFeaturesTitle,
              style: GoogleFonts.rajdhani(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: theme.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            ..._buildFeatureItems(s),
          ],
        ),
      ),
    );
  }

  List<SubscriptionFeatureItem> _buildFeatureItems(AppStrings s) {
    return [
      SubscriptionFeatureItem(
        title: s.joninFeature1Title,
        description: s.joninFeature1Desc,
        icon: Icons.collections_bookmark_rounded,
        color: AppColors.rankJonin,
        isLast: false,
      ),
      SubscriptionFeatureItem(
        title: s.joninFeature2Title,
        description: s.joninFeature2Desc,
        icon: Icons.block_rounded,
        color: AppColors.rankJonin,
        isLast: false,
      ),
      SubscriptionFeatureItem(
        title: s.joninFeature3Title,
        description: s.joninFeature3Desc,
        icon: Icons.smart_toy_outlined,
        color: AppColors.rankJonin,
        isLast: false,
      ),
      SubscriptionFeatureItem(
        title: s.joninFeature4Title,
        description: s.joninFeature4Desc,
        icon: Icons.verified_outlined,
        color: AppColors.rankJonin,
        isLast: false,
      ),
      SubscriptionFeatureItem(
        title: s.kageFeature1Title,
        description: s.kageFeature1Desc,
        icon: Icons.workspace_premium_rounded,
        color: AppColors.rankKage,
        isLast: false,
      ),
      SubscriptionFeatureItem(
        title: s.kageFeature2Title,
        description: s.kageFeature2Desc,
        icon: Icons.auto_awesome_outlined,
        color: AppColors.rankKage,
        isLast: false,
      ),
      SubscriptionFeatureItem(
        title: s.kageFeature3Title,
        description: s.kageFeature3Desc,
        icon: Icons.download_rounded,
        color: AppColors.rankKage,
        isLast: false,
      ),
      SubscriptionFeatureItem(
        title: s.kageFeature4Title,
        description: s.kageFeature4Desc,
        icon: Icons.palette_outlined,
        color: AppColors.rankKage,
        isLast: true,
      ),
    ];
  }
}
