# Make Her Smile 💚

A Flutter application designed to help users manage their relationship profile, settings, and daily interactions. Built with a clean, modern "Mint/Green" aesthetic and Clean Architecture.

![Flutter](https://img.shields.io/badge/Flutter-3.19-blue?style=flat&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.3-blue?style=flat&logo=dart)
![Firebase](https://img.shields.io/badge/Firebase-Auth-orange?style=flat&logo=firebase)

## Features

- **🔐 Authentication**: Email/Password login and signup using Firebase Auth
- **🏠 Home**: "Today's Grit" card with daily suggestions and relationship tips
- **👤 Profile**: User profile with relationship status, tags, and progress stats
- **⚙️ Settings**: Configure relationship distance, budget mode, emotional comfort, and tags
- **💝 Add Her**: Initial setup flow to add partner details
- **🎨 Modern UI**: Custom "Mint" theme, rounded UI elements, and responsive layout

## App Screenshots

### Authentication Flow
| Get Started | Sign Up | Login |
|-------------|---------|-------|
| <img src="https://github.com/altaf1346/make_her_smile/blob/master/assets/image/Screenshot_20251128_124151.png" width="200"> | <img src="https://github.com/altaf1346/make_her_smile/blob/master/assets/image/Screenshot_20251128_124215.png" width="200"> | <img src="https://github.com/altaf1346/make_her_smile/blob/master/assets/image/Screenshot_20251128_124239.png" width="200"> |

### Main Application
| Home | Profile | Settings |
|------|---------|----------|
| <img src="https://github.com/altaf1346/make_her_smile/blob/master/assets/image/Screenshot_20251128_123728.png" width="200"> | <img src="https://github.com/altaf1346/make_her_smile/blob/master/assets/image/Screenshot_20251128_124118.png" width="200"> | <img src="https://github.com/altaf1346/make_her_smile/blob/master/assets/image/Screenshot_20251128_123959.png" width="200"> |

## Tech Stack

- **Flutter 3.19** - Cross-platform framework
- **Dart 3.3** - Programming language
- **Firebase Auth** - Authentication service
- **Provider** - State management
- **Google Fonts** - Typography (Poppins)
- **Intl** - Date formatting and localization

## Folder Structure

```
lib/
  main.dart          # Entry point
  app.dart           # App configuration and routing
  core/              # Core utilities, theme, and widgets
    theme.dart
    constants.dart
    widgets/
  features/          # Feature-based modules
    auth/
    home/
    profile/
    settings/
    add_her/
  data/              # Data layer (Models)
```

## Setup Guide

1.  **Prerequisites**:
    - Flutter SDK installed.
    - Android Studio / VS Code configured.
    - Firebase project created.

2.  **Firebase Setup**:
    - Place your `google-services.json` file in `android/app/`.
    - (Optional) For iOS, place `GoogleService-Info.plist` in `ios/Runner/`.

3.  **Install Dependencies**:
    ```bash
    flutter pub get
    ```

4.  **Run the App**:
    ```bash
    flutter run
    ```
Made with 💚 for better relationships

Remember: The best relationships are built on consistent effort and genuine care. This app is just a tool to help you along the way.

