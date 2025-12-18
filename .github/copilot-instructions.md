# GitHub Copilot Instructions for Flutter Project

You are an expert Flutter developer assisting with the `learn_go` project. This is a student portal application built with Flutter, Riverpod, and Dio.

## 🏗 Architecture & Project Structure

- **Feature-First Organization**: Code is organized by feature in `lib/features/`.
  - Example: `lib/features/auth/` contains `presentation`, `application`, `domain`, and `data` layers for authentication.
- **Layered Architecture**:
  - **Presentation**: Widgets and Riverpod Controllers (`StateNotifier`, `AsyncNotifier`).
  - **Application**: Service/Provider layer bridging UI and Data.
  - **Domain**: Pure Dart entities (often `freezed`) and repository interfaces.
  - **Data**: Repository implementations and data sources (API calls, DB).
- **Core**: Shared utilities, config, and network logic reside in `lib/core/`.

## 🛠 Tech Stack & Libraries

- **Framework**: Flutter 3.24+ / Dart 3.9+
- **State Management**: `hooks_riverpod` & `flutter_hooks`.
- **Navigation**: `go_router`.
- **Networking**: `dio` (configured in `lib/core/network/dio_provider.dart`).
- **Code Generation**: `freezed`, `json_serializable`, `isar_generator`.
- **Local DB**: `isar`.

## 📝 Coding Conventions

- **State Management**:
  - Use `ConsumerWidget` or `HookConsumerWidget` for widgets reading state.
  - Prefer `AsyncValue` for handling asynchronous data states (loading, error, data).
- **Models**:
  - Use `@freezed` for immutable data classes and unions.
  - Use `@JsonSerializable` for API DTOs.
- **Environment**:
  - Configuration is loaded from `.env` via `flutter_dotenv`.
  - Access config via `AppEnvironment` provider.

## 🚀 Development Workflow

- **Run App**: `flutter run`
- **Code Generation**: Run this command after modifying models or providers:
  ```bash
  dart run build_runner build --delete-conflicting-outputs
  ```
- **Formatting**: `dart format .`

## 🔍 Key Files

- **Entry Point**: `lib/main.dart`
- **App Config**: `lib/app.dart`
- **Env Config**: `lib/core/config/app_environment.dart`
- **Auth Repo**: `lib/features/auth/data/auth_repository.dart`
