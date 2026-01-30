# Fitness App UI

A premium fitness and nutrition tracking application built with Flutter, featuring high-fidelity UI designs, smooth animations, and interactive haptic feedback.

## 1. Dependencies Used & Why

| Dependency | Purpose |
| :--- | :--- |
| **provider** | Used for state management across the app, specifically for handling navigation states and mood tracking. |
| **vibration** | Implements custom haptic feedback patterns to enhance the tactile experience during interactions. |
| **audioplayers** | Used to play subtle sound effects for user actions, providing auditory feedback. |
| **flutter_animate** | Powers the smooth micro-animations and transitions throughout the UI. |
| **intl** | Handles date and time formatting for the training calendar and nutrition logs. |
| **cupertino_icons** | Provides a set of high-quality icons for a consistent iOS-style aesthetic. |

## 2. Project Structure

The project follows a modular organization to ensure scalability and maintainability:

```text
lib/
 ├── models/     # Data structures (e.g., Mood model)
 ├── providers/  # State management logic using the Provider pattern
 ├── screens/    # High-level page widgets (Nutrition, Plan, Mood, Profile)
 ├── theme/      # Centralized app styling, colors, and typography
 ├── utils/      # Service utilities for haptics, sounds, and global helpers
 └── widgets/    # Shared reusable UI components (Bottom Nav, etc.)
```

- **`assets/`**: Contains custom UI assets including mood images and sound effects.

## 3. App Screenshots

*Screenshots demonstrating the high-fidelity UI implementation:*

- **Nutrition Dashboard**: Features a central weather indicator, daily workout summaries, and detailed nutrient/hydration insights.
- **Training Calendar**: A detailed weekly plan with categorized workout cards and interactive day headers.
- **Mood Selector**: A circular, interactive selector with custom glow effects and image-based assets.

*(Note: Real screenshots should be captured from the running device/emulator)*

## 4. App Video

*Video demonstration showing the interactive flow, haptic response, and smooth transitions:*

[Watch the Demonstration Video]

*(Note: Link to a screen recording showing the app in action)*

## 5. App APK

The application can be installed and tested on Android devices using the link below:

**[Download Fitness App APK (Debug Build)](build/app/outputs/flutter-apk/app-debug.apk)**

---
*Created with focus on premium aesthetics and user experience.*
