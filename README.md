# UI Collections

A Flutter playground of hand-built login and signup screens. Each screen is a
fully self-contained, custom-painted UI collection — no third-party UI kits.

> This is a UI gallery, not a finished app. Only one screen is shown at a time.

## Screens

| Collection | Screen | Notes |
| --- | --- | --- |
| `wallet_login_signup` | `WalletLoginScreen` | Dark crypto-wallet login / signup with a custom-painted S-curve tab switcher, animated form fields, social buttons, and a swipe-to-submit action. Currently mounted in `main.dart`. |
| `curve_ui` | `CurveLoginUi` | Yellow-on-dark food delivery style login with a curved `ClipPath` image header and custom-painted inputs. |

## Getting Started

Requires the Flutter SDK (stable channel) with Dart `^3.12.1`.

```bash
flutter pub get
flutter run
```

### Switching between collections

There is no router or navigation. To view a different collection, change the
`home:` widget in `lib/main.dart`:

```dart
// lib/main.dart
home: const WalletLoginScreen(), // lib/wallet_login_signup/
// or
home: const CurveLoginUi(),      // lib/curve_ui/
```

## Project Structure

```
lib/
├── main.dart                         # App entrypoint; picks the screen to show
├── curve_ui/
│   ├── screen/curve_login_ui.dart    # Screen
│   ├── widgets/curved_header.dart    # Curved image header + Clipper
│   └── themes/theme_color.dart       # ThemeColor palette
└── wallet_login_signup/
    ├── wallet_login_screen.dart      # Screen
    ├── widgets/                      # TextField, social button, tab painter
    └── theme/wallet_theme_color.dart # WalletThemeColor palette
```

Each collection owns its own widgets and color constants — palettes are not
shared between collections.

## Quality

```bash
flutter analyze   # lint (stock flutter_lints, no custom rules)
flutter test      # note: test/widget_test.dart is a stale default template
```

The only bundled test, `test/widget_test.dart`, is the default Flutter counter
test and does not match the current UI (`MyApp` no longer has a counter), so
`flutter test` currently fails. Replace it when adding real tests.

## Assets

`assets/images/p4.jpg` is the only declared asset (used by `curve_ui`). Add new
images to the `flutter: assets:` list in `pubspec.yaml` before referencing them.

## Dependencies

- `slide_to_act` — swipe-to-submit slider used by `WalletLoginScreen`.
- `flutter_lints` — lint rules (see `analysis_options.yaml`).
