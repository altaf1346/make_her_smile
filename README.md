# Make Her Smile
A Flutter application designed to help users manage their relationship profile, settings, and daily interactions. Built with a clean, modern "Mint/Green" aesthetic and Clean Architecture.

## Features

- **Authentication**: Email/Password login and signup using Firebase Auth.
- **Home**: "Today's Grit" card with daily suggestions.
- **Profile**: User profile with relationship status, tags, and progress stats.
- **Settings**: Configure relationship distance, budget mode, emotional comfort, and tags.
- **Add Her**: Initial setup flow to add partner details.
- **Modern UI**: Custom "Mint" theme, rounded UI elements, and responsive layout.

## Tech Stack

- **Flutter & Dart**: Core framework and language.
- **Firebase**: Authentication and backend services.
- **Provider**: State management.
- **Google Fonts**: Typography (Poppins).
- **Intl**: Date formatting.

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

## Screenshots

*(Placeholders for screenshots)*

| Login | Home | Profile | Settings |
|-------|------|---------|----------|
| ...   | ...  | ...     | ...      |

## Demo Video

*(Placeholder for demo video)*
