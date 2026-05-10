# OTADEX — Play Store preparation

## Etat

- App name: OTADEX
- Package name: `com.otadex.otadex`
- Version: `1.0.0+1`
- Firebase project: `tilqui`
- Public legal pages target:
  - Privacy policy: `https://otadex.tilstack.me/privacy-policy.html`
  - Terms: `https://otadex.tilstack.me/terms.html`
  - Account deletion: `https://otadex.tilstack.me/account-deletion.html`

## Actions manuelles avant soumission

1. Activer GitHub Pages:
   - Repository settings -> Pages
   - Source: Deploy from a branch
   - Branch: `master`
   - Folder: `/docs`
2. Verifier que les trois URLs legales sont publiques, sans login, et non bloquees.
3. Dans Firebase Console -> Authentication -> Sign-in method:
   - Activer Email/Password
   - Activer Google
4. Deployer les rules Firestore avant release:
   - `firebase deploy --only firestore:rules`
5. Dans Play Console:
   - Renseigner la privacy policy URL.
   - Remplir Data Safety avec `data-safety.md`.
   - Remplir la fiche Play Store avec `store-listing-fr.md`.
6. Tester l'app sur Android reel ou emulateur avec `test-plan.md`.

## Documents

- `store-listing-fr.md`: textes Play Store en francais.
- `data-safety.md`: brouillon pour le formulaire Data Safety.
- `test-plan.md`: scenarios de verification avant release.
- `screenshots.md`: liste de captures d'ecran a produire.
