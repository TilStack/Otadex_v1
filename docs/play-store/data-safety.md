# OTADEX — Data Safety draft

Ce document prepare les reponses Play Console. Il doit etre verifie avant soumission selon les fonctionnalites reellement actives dans l'APK publie.

## Donnees collectees

### Informations personnelles

- Adresse e-mail
  - Collectee: oui, si l'utilisateur cree un compte ou se connecte.
  - Finalite: authentification, gestion du compte, securite.
  - Partagee avec des tiers: non, hors sous-traitants techniques Firebase/Google necessaires au service.

- Nom d'affichage / pseudo
  - Collecte: oui.
  - Finalite: profil utilisateur, personnalisation de l'experience.
  - Partagee avec des tiers: non.

### Identifiants

- Identifiant utilisateur Firebase UID
  - Collecte: oui.
  - Finalite: associer les donnees au compte utilisateur.
  - Partagee avec des tiers: non, hors infrastructure Firebase.

### Activite dans l'application

- Collection de personnages, preferences et interactions internes
  - Collecte: oui si les fonctionnalites sont utilisees.
  - Finalite: sauvegarde de la collection, personnalisation.
  - Partagee avec des tiers: non.

### Photos et fichiers

- Avatar choisi localement
  - Collecte serveur: non pour l'instant.
  - Note: Firebase Storage est volontairement repousse. L'image peut etre temporaire/local cache.

## Donnees non collectees pour l'instant

- Localisation precise.
- Contacts.
- SMS.
- Historique d'appels.
- Donnees de sante.
- Donnees financieres reelles tant que le paiement n'est pas branche.

## Securite

- Authentification geree par Firebase Authentication.
- Donnees utilisateur stockees dans Cloud Firestore.
- Les communications Firebase utilisent HTTPS/TLS.

## Suppression de compte

Page publique:

`https://otadex.tilstack.me/account-deletion.html`

Avant publication, prevoir un flux in-app ou une procedure claire par email pour demander la suppression du compte et des donnees associees.

## Points a verifier avant Play Console

- Confirmer les providers Firebase actifs: Email/Password et Google.
- Deployer `firestore.rules` avant release pour remplacer les rules de test.
- Confirmer si Analytics/Crashlytics sont ajoutes ou non. S'ils sont ajoutes, mettre a jour cette fiche.
- Confirmer si des commentaires, likes ou paiements sont actifs dans l'APK publie.
