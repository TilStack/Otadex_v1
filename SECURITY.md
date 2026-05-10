# Sécurité

Ce document résume les bonnes pratiques de sécurité pour le projet OTADEX.

## Objectif

Le projet est public et les pages GitHub sont déjà activées. Le but est de limiter l'utilisation malveillante en conservant un minimum de sécurité et de gouvernance.

## Actions en place

- Le code source ne doit jamais contenir de secrets, clés API ou identifiants.
- Firebase et toute API externe doivent être configurés via des variables d'environnement, et les fichiers de configuration sensibles ne doivent pas être committés.
- Firestore doit être protégé par des règles strictes qui limitent l'accès en lecture/écriture aux utilisateurs authentifiés et aux rôles autorisés.
- Le dépôt est public, mais la licence explicite indique que l'utilisation commerciale ou malveillante est interdite.

## Recommandations pour éviter les usages malveillants

1. Vérifier et renforcer les règles Firestore avant toute mise en production.
2. Ne pas exposer de services d'administration dans des pages publiques ou dans le code front-end.
3. Activer 2FA sur le compte GitHub qui gère le projet.
4. Ajouter un `CONTRIBUTING.md` et un `CODE_OF_CONDUCT` indiquant clairement que les contributions doivent respecter une charte d'usage éthique.
5. Surveiller les demandes de fork et les usages de l'application publique.

## Surveillance

- Activer les alertes de sécurité GitHub (dependabot, secret scanning).
- Vérifier régulièrement les modifications de la branche `main`/`master`.
- Tester l'application sur un device réel pour s'assurer que l'authentification et les règles Firebase fonctionnent comme prévu.
