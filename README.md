# CitizenApp

Application mobile pour l'inscription citoyenne.

## Stack technique

Le projet utilise **Flutter** comme framework principal, pour sa stabilité, ses performances natives et la cohérence du rendu sur Android/iOS avec un seul codebase.

> Note : le projet a débuté avec React Native (Expo) + gluestack-ui. Le passage à Flutter a été fait pour gagner en stabilité, mais **les processus métiers restent identiques** — seule la couche technique change.

## Processus métiers (inchangés)

- Activation du compte citoyen
- Accès au données citoyens

## Structure du projet

```
citizenapp/
├── lib/
│   ├── main.dart
│   ├── pages/            # Écrans de l'application
│   ├── components/       # Composants réutilisables
│   ├── models/           # Modèles de données
│   ├── bloc/             # Gestion des états
│   │   │── Languagebloc            # Gestion de l'état de langue
│   │   ├── onboardingstagingbloc   # Gestion des états de l'onboarding
│   │   ├── Activationstepbloc      # Gestion des états d'activation de compte
│   │   ├── Activateocrcapturebloc  # Gestion des états de capture OCR
│   │   └── Otpbloc                 # Gestion des états de validation OTP
│   └── utils/theme.dart  # Charte graphique
├── assets/               # Fichiers statiques
├── pubspec.yaml
├── mason.yaml            # Configuration de Mason
├── mason-lock.yaml       # Lock file de Mason
└── README.md
```

## Prérequis

- Flutter SDK (version stable recommandée)
- Un éditeur (VS Code recommandé + extension Flutter)
- Mason CLI ( si pas sur VS Code)

## Installation

```bash
flutter pub get
flutter run
```

## Build

```bash
flutter build apk --split-per-abi       # Android
flutter build ios                       # iOS
```

A récupérer le build arm64

## Contribution

Merci de respecter la structure existante et de documenter toute nouvelle étape du processus métier ajoutée au flux d'inscription.

Par @IANTSOGod
