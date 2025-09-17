# groceries_app

A production-ready Flutter mobile application for groceries shopping, built with a scalable **Clean Architecture** and robust **Bloc pattern** for state management.

---

## Project Overview

This project demonstrates best practices in Flutter development, focusing on maintainability, testability, and scalability. It leverages Bloc for state management, Equatable for immutable states, and organizes code into clear feature modules. The app supports multiple environments (dev, staging, prod) and is ready for internationalization.

---

## Code Structure & Architecture

```
groceries_app/
├── android/                  # Native Android project files
├── ios/                      # Native iOS project files
├── assets/                   # Images, icons, fonts, etc.
├── lib/
│   ├── core/                 # App-wide utilities, constants, logging, extensions
│   │   ├── assets_gen/       # Generated asset references
│   │   ├── contants/         # Static constants (image paths, etc.)
│   │   ├── enums/            # Enum definitions
│   │   ├── env/              # Environment configs (dev, prod, staging)
│   │   ├── extentions/       # Dart/Flutter extension methods
│   │   ├── logging/          # Logging utilities
│   │   └── utils/            # General utility functions
│   ├── domain/               # Business logic layer (pure Dart, no Flutter)
│   │   ├── core/             # Base classes (failures, result, usecase)
│   │   ├── entities/         # Data models (Cart, Product, User, etc.)
│   │   ├── repositories/     # Abstract repository interfaces
│   │   └── usecase/          # Use case classes (application logic)
│   ├── data/                 # Data layer (API, local storage, mappers)
│   │   ├── core/             # Data-specific utilities (exceptions, interceptors)
│   │   ├── datasources/      # Local/remote data sources
│   │   ├── mappers/          # Data-to-domain model converters
│   │   ├── models/           # Data models for requests/responses
│   │   └── repositories/     # Repository implementations
│   ├── di/                   # Dependency injection setup (injector, modules)
│   ├── l10n/                 # Localization files and generated code
│   ├── presentation/         # UI layer (screens, widgets, blocs, themes)
│   │   ├── app_imports.dart  # Barrel file for shared imports
│   │   ├── bloc/             # Bloc logic per feature (events, states, blocs)
│   │   ├── error/            # UI error mapping
│   │   ├── routes/           # App routing (GoRouter, route names)
│   │   ├── screens/          # Feature screens (account, cart, shop, etc.)
│   │   ├── shared/           # Reusable UI widgets (buttons, dialogs, etc.)
│   │   └── theme/            # App-wide themes and typography
│   ├── app.dart              # App root widget
│   ├── main_dev.dart         # Entry point for dev environment
│   ├── main_staging.dart     # Entry point for staging environment
│   ├── main_prod.dart        # Entry point for production
├── test/                     # Unit and widget tests
├── web/                      # Web build files
├── pubspec.yaml              # Dependencies and asset registration
├── l10n.yaml                 # Localization configuration
├── l10n_untranslated.txt     # Untranslated localization keys
└── .github/
      └── copilot-instructions.md # AI coding guidelines
```

### Clean Architecture Layers Explained

- **lib/core/**  
   Shared utilities, constants, logging, and extensions used across all layers.  
   _Why_: Centralizes reusable code and configuration.

- **lib/domain/**  
   Pure Dart business logic.

  - **core/**: Base classes for error handling, results, and use cases.
  - **entities/**: Immutable data models representing app concepts (e.g., CartEntity, ProductEntity).
  - **repositories/**: Abstract interfaces for data access (e.g., `AuthRepository`).
  - **usecase/**: Application logic, orchestrating entities and repositories (e.g., `LoginUsecase`).  
    _Why_: Decouples business rules from sources and UI.

- **lib/data/**  
   Data layer for API, local storage, and mapping.

  - **core/**: Data-specific utilities (e.g., exceptions, interceptors).
  - **datasources/**: Local (e.g., SharedPreferences) and remote (e.g., API) data providers.
  - **mappers/**: Convert data models to domain entities.
  - **models/**: Request/response models for APIs.
  - **repositories/**: Implements domain repository interfaces using datasources and mappers.  
    _Why_: Isolates data access and transformation logic.

- **lib/di/**  
   Dependency injection setup using `injectable` and `get_it`.

  - **injector.dart/config.dart**: DI container and generated config.
  - **env_module.dart**: Environment-specific DI.
  - **third_party_module.dart**: DI for external packages.  
    _Why_: Enables testability and environment flexibility.

- **lib/presentation/**  
   UI layer, state management, and navigation.

  - **bloc/**: Bloc pattern for state management (events, states, blocs per feature).
  - **screens/**: Feature screens, each with its own folder and widgets.
  - **shared/**: Common UI widgets (buttons, dialogs, etc.).
  - **theme/**: Centralized theme and typography.
  - **routes/**: Routing setup with GoRouter.
  - **error/**: Maps domain/data errors to UI messages.  
    _Why_: Keeps UI modular, testable, and consistent.

- **lib/app.dart**  
   Root widget, sets up theme, localization, and routing.

- **lib/main\_\*.dart**  
   Entry points for different environments (dev, staging, prod).

- **assets/**  
   Images, icons, fonts, registered in [`pubspec.yaml`](pubspec.yaml).

- **test/**  
   Unit and widget tests, mirroring feature structure.

- **l10n/**  
   Localization files and generated code for i18n.

- **.github/copilot-instructions.md**  
   Coding guidelines for AI agents and contributors.

---

**How it works:**

- UI triggers Bloc events (in `presentation/bloc/`), which use domain use cases (`domain/usecase/`) to fetch/update data via repositories (`domain/repositories/`).
- Repositories are implemented in `data/repositories/`, using datasources and mappers.
- Dependency injection (`di/`) wires everything together for each environment.
- Shared utilities and constants (`core/`) are used throughout.
- All assets and localization are centralized for maintainability.

**Why this structure?**

- Maximizes separation of concerns, testability, and scalability.
- Follows industry best practices for Flutter Clean Architecture.
- Makes onboarding and feature development straightforward for teams.

---

## Patterns & Technologies Used

- **Clean Architecture**: Separates presentation, business logic, and data layers for maintainability and testability.
- **Bloc Pattern**: All UI state changes are handled via Bloc events and states. No direct use of `setState`; instead, use `BlocBuilder` and `BlocProvider`.
- **Equatable**: Ensures states are immutable and comparable, reducing bugs and improving performance.
- **Dependency Injection**: Centralized setup for easy testing and environment configuration.
- **Localization**: Ready for i18n via [`l10n.yaml`](l10n.yaml) and asset files.
- **Custom Themes**: Consistent look and feel across the app.

### Third-Party Libraries

- [`flutter_bloc`](https://pub.dev/packages/flutter_bloc): Bloc state management.
- [`equatable`](https://pub.dev/packages/equatable): Immutable, comparable state objects.
- (Add others as needed from [`pubspec.yaml`](pubspec.yaml).)

---

## Example: Product Detail Feature Flow

1. **Event**: User taps "favorite" icon.
   - Dispatches `ToggleFavoriteEvent` in [`product_detail_event.dart`](lib/presentation/bloc/product_detail/product_detail_event.dart).
2. **Bloc**: [`ProductDetailBloc`](lib/presentation/bloc/product_detail/product_detail_bloc.dart) receives event, updates state.
3. **State**: [`ProductDetailState`](lib/presentation/bloc/product_detail/product_detail_state.dart) updates `isFavorite` property.
4. **UI**: [`ProductDetailScreen`](lib/presentation/screens/product_detail/product_detail_screen.dart) uses `BlocBuilder` with `buildWhen` to rebuild only the favorite icon.
5. **Widget**: [`ProductDetailExpandableWidget`](lib/presentation/screens/product_detail/widgets/product_detail_expandable_widget.dart) receives state and handlers via Bloc, remains stateless.

---

## Best Practices

- **Always use Bloc for state changes**; avoid `setState`.
- **Modularize features**: Each screen/feature in its own folder.
- **Use `buildWhen` in BlocBuilder** to optimize widget rebuilds.
- **Centralize assets and themes** for consistency.
- **Write tests for each feature** in the [`test`](test) folder.
- **Register new assets in [`pubspec.yaml`](pubspec.yaml)**.
- **Follow snake_case naming** for files and folders.

---

## Getting Started

1. **Install dependencies**:  
   `flutter pub get`
2. **Run app**:  
   `flutter run`
3. **Build for production**:  
   `flutter build`
4. **Run tests**:  
   `flutter test`
5. **Add assets**:  
   Place in [`assets`](assets), register in [`pubspec.yaml`](pubspec.yaml).

---

## Resources

- [Bloc Documentation](https://bloclibrary.dev/#/)
- [Flutter Documentation](https://docs.flutter.dev/)
- [Equatable Documentation](https://pub.dev/packages/equatable)

---
