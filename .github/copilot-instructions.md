# Copilot Instructions for Groceries_App_UI

## Project Overview

- Flutter groceries shopping app using Clean Architecture and Bloc pattern.
- Main code in `lib/`, features under `lib/presentation/screens/`, business logic in `lib/presentation/bloc/`.
- Assets in `assets/`, referenced in UI and registered in `pubspec.yaml`.

## Clean Architecture Structure

- **lib/core/**: Shared utilities, constants, logging, extensions. Use for reusable code and configuration.
- **lib/domain/**: Pure Dart business logic. Contains:
  - **core/**: Base classes for error handling, results, use cases.
  - **entities/**: Immutable data models (e.g., CartEntity, ProductEntity).
  - **repositories/**: Abstract interfaces for data access.
  - **usecase/**: Application logic, orchestrating entities and repositories.
- **lib/data/**: Data layer for API, local storage, mapping. Contains:
  - **core/**: Data-specific utilities (exceptions, interceptors).
  - **datasources/**: Local/remote data sources.
  - **mappers/**: Data-to-domain model converters.
  - **models/**: Request/response models for APIs.
  - **repositories/**: Implements domain repository interfaces.
- **lib/di/**: Dependency injection setup (`injectable`, `get_it`).
- **lib/presentation/**: UI layer, state management, navigation. Contains:
  - **bloc/**: Bloc pattern for state management (events, states, blocs per feature).
  - **screens/**: Feature screens, each with its own folder and widgets.
  - **shared/**: Common UI widgets (buttons, dialogs, etc.).
  - **theme/**: Centralized theme and typography.
  - **routes/**: Routing setup with GoRouter.
  - **error/**: Maps domain/data errors to UI messages.
- **lib/app.dart**: Root widget, sets up theme, localization, routing.
- **lib/main\_\*.dart**: Entry points for different environments (dev, staging, prod).
- **assets/**: Images, icons, fonts, registered in `pubspec.yaml`.
- **test/**: Unit and widget tests, mirroring feature structure.
- **l10n/**: Localization files and generated code for i18n.

## Architecture & Patterns

- **Bloc Pattern**: All state changes via Bloc events/states. No `setState`; use `BlocBuilder` and `BlocProvider`.
- **State Structure**: States use Equatable and `copyWith` for immutability.
- **Events**: Each user action has a dedicated event class.
- **UI Updates**: Use `BlocBuilder` with `buildWhen` for efficient rebuilds.
- **Widgets**: Custom widgets are stateless, receive state/handlers from Bloc.

## Developer Workflows

- **Build**: `flutter build` for production, `flutter run` for development.
- **Test**: Place tests in `test/`, run with `flutter test`.
- **Hot Reload**: Use IDE hot reload for UI iteration.
- **Assets**: Add to `assets/`, update `pubspec.yaml`.

## Conventions & Integration

- **File Naming**: Use snake_case for Dart files/folders.
- **Feature Structure**: Each screen in its own folder under `lib/presentation/screens/`, widgets in `widgets/`.
- **Bloc Location**: Blocs/events/states in `lib/presentation/bloc/<feature>/`.
- **Localization**: See `l10n.yaml` and `l10n_untranslated.txt`.
- **External Packages**: Use `equatable`, `flutter_bloc`, custom themes/typography.

## Example Feature Flow

1. User action dispatches event (e.g., `ToggleFavoriteEvent`).
2. Bloc receives event, updates state.
3. State changes trigger UI rebuild via `BlocBuilder`.
4. Stateless widgets receive updated state/handlers.

## Tips for AI Agents & Contributors

- Always use Bloc for state changes.
- For new features: define state, events, bloc logic, update UI with BlocBuilder.
- Use `buildWhen` in BlocBuilder.
- Reference assets and theme styles from respective folders.
- For new screens, create a folder in `lib/presentation/screens/` and follow existing structure.

---

If any conventions or workflows are unclear, ask the user for clarification or examples from the codebase.
