# CitizenApp

Application mobile pour l'inscription citoyenne.

## Stack technique

Le projet utilise **Flutter** comme framework principal, pour sa stabilité, ses performances natives et la cohérence du rendu sur Android/iOS avec un seul codebase.

> Note : le projet a débuté avec React Native (Expo) + gluestack-ui. Le passage à Flutter a été fait pour gagner en stabilité, mais **les processus métiers restent identiques** — seule la couche technique change.

## Processus métiers (inchangés)

- Inscription citoyenne (saisie des informations personnelles)
- Vérification / validation des données saisies
- Gestion du profil citoyen
- (Ajouter ici les étapes spécifiques déjà définies dans les specs du projet)

## Structure du projet

```
citizenapp/
├── lib/
│   ├── main.dart
│   ├── pages/            # Écrans de l'application
│   ├── components/       # Composants réutilisables
│   ├── models/           # Modèles de données
│   ├── bloc/             # Gestion des états
│   └── utils/theme.dart  # Charte graphique
├── assets/               # Fichiers statiques
├── pubspec.yaml
└── README.md
```

## Prérequis

- Flutter SDK (version stable recommandée)
- Un éditeur (VS Code recommandé + extension Flutter)

## Installation

```bash
flutter pub get
flutter run
```

## Build

```bash
flutter build apk        # Android
flutter build ios        # iOS
```

## Contribution

Merci de respecter la structure existante et de documenter toute nouvelle étape du processus métier ajoutée au flux d'inscription.
