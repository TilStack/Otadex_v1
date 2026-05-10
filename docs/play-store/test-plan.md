# OTADEX — Test plan avant Play Store

## Environnement

- Android package: `com.otadex.otadex`
- Firebase project: `tilqui`
- Build cible: Android release candidate

## Tests Firebase Auth

### Inscription email

1. Ouvrir l'ecran inscription.
2. Saisir un pseudo valide, un email jamais utilise, un mot de passe valide.
3. Accepter les conditions.
4. Valider.

Resultat attendu:

- Navigation vers Home.
- `isLoggedInProvider` passe a `true`.
- Un utilisateur apparait dans Firebase Authentication.
- Un document est cree dans Firestore `users/{uid}` avec:
  - `uid`
  - `pseudo`
  - `email`
  - `abonnement: genin`
  - `score_fan: 0`
  - `badges: []`
  - `created_at`

### Connexion email

1. Se deconnecter.
2. Revenir sur login.
3. Saisir email/mot de passe du compte cree.
4. Valider.

Resultat attendu:

- Navigation vers Home.
- Pas d'erreur sous le champ mot de passe.

### Erreurs email

Verifier:

- Email invalide.
- Mot de passe faux.
- Compte inconnu.
- Email deja utilise a l'inscription.
- Mot de passe faible.

Resultat attendu:

- Message francais clair dans le formulaire.
- Pas de navigation vers Home.

### Connexion Google

1. Cliquer sur continuer avec Google.
2. Choisir un compte.

Resultat attendu:

- Connexion Firebase reussie.
- Document Firestore `users/{uid}` cree ou mis a jour.
- Navigation vers Home.

### Annulation Google

1. Cliquer sur continuer avec Google.
2. Annuler la selection.

Resultat attendu:

- Pas de session locale marquee connectee.
- Message d'erreur ou annulation visible.

### Deconnexion

1. Aller dans Profil.
2. Cliquer sur deconnexion.

Resultat attendu:

- FirebaseAuth signOut.
- GoogleSignIn signOut.
- `isLoggedInProvider` passe a `false`.
- Retour vers Splash.

## Tests pages legales

Verifier que ces URLs sont publiques:

- `https://otadex.tilstack.me/privacy-policy.html`
- `https://otadex.tilstack.me/terms.html`
- `https://otadex.tilstack.me/account-deletion.html`

## Tests navigation MVP

- Splash -> onboarding/login/home.
- Home.
- Recherche.
- Fiche personnage.
- Galerie plein ecran.
- Collection.
- Profil.
- Ecrans legales in-app.

## Tests qualite

- `flutter analyze`
- `dart analyze`
- `flutter test`
- Verifier puis deployer les rules Firestore:
  - `firebase deploy --only firestore:rules`
- Build Android release:
  - `flutter build appbundle`

Note: le build release peut necessiter la configuration de signature Play Store.
