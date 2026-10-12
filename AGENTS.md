# AGENTS.md

Flutter UI showcase app (`ui_collections`), stable channel, Dart SDK `^3.12.1`.
Not a real app: `lib/` is a gallery of self-contained login/signup screens.

## Commands
- `flutter pub get` — after changing `pubspec.yaml`
- `flutter run` — run on the selected device
- `flutter analyze` — lint (uses stock `flutter_lints`; no custom rules in `analysis_options.yaml`)
- `flutter test` — see warning below before trusting results

## Architecture
- Each top-level folder under `lib/` is one independent UI "collection": `curve_ui/` and
  `wallet_login_signup/`. Each is fully self-contained with `screen/` (or a screen file),
  `widgets/`, and `theme/` or `themes/` holding its own color-constants class
  (`ThemeColor`, `WalletThemeColor`). Colors are not shared across collections.
- There is **no router and no state-management package**. Only one screen is reachable at a
  time; switch the displayed screen by editing `home:` in `lib/main.dart`.
- `lib/main.dart` currently mounts `WalletLoginScreen` (`lib/wallet_login_signup/`).
  `lib/curve_ui/` is committed but only reachable if you re-point `main.dart` at
  `CurveLoginUi`. `lib/wallet_login_signup/` may be untracked in git — check `git status`.
- Screens are stateless/stateful widgets that use `setState` directly; no DI or routing.

## Gotchas
- `test/widget_test.dart` is the **stale default Flutter counter test** (expects `'0'`,
  `Icons.add`). `MyApp` no longer contains a counter, so `flutter test` fails. Replace/delete
  it rather than trusting it as a passing baseline.
- Only `assets/images/p4.jpg` is declared in `pubspec.yaml`. Any new image must be added to
  the `flutter: assets:` list in `pubspec.yaml` (paths are relative to the project root, as
  used in `lib/curve_ui/widgets/curved_header.dart` via `AssetImage`).
- `slide_to_act` is the one non-Flutter runtime dependency (used by `WalletLoginScreen`).
