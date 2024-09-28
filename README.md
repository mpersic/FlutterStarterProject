# Flutter Starter Project

## Overview
This Flutter application implements **Clean Architecture** principles, providing a robust structure for building scalable and maintainable applications. The project utilizes the **BLoC (Business Logic Component)** pattern for state management, ensuring a clear separation of concerns and making it easier to test and manage application logic.

## Key Features
- **Clean Architecture**: Organized layers of code that separate presentation, domain, and data, making the app easier to maintain and extend.
- **BLoC Pattern**: Efficient state management through reactive programming, enabling a smooth and responsive user interface.
- **Localization Support**: The app supports multiple languages, allowing users to interact in their preferred language. Easily add new languages and manage translations.
- **Dark Mode**: A fully responsive design that supports both light and dark themes, enhancing user experience in different lighting conditions.
- **Dependency Injection**: Utilizes the `injectable` and `get_it` packages to manage dependencies efficiently. This setup simplifies testing, increases flexibility, and ensures that your code adheres to the Single Responsibility Principle by decoupling object creation from business logic.

## Common Commands
- **Installing New Packages**:  
  Use this command to install new packages or update existing ones after modifying the `pubspec.yaml` file:
  ```bash
  flutter pub get
- **Generating Dependency Injection Files:**: 
  Whenever you modify or add new injectable classes, run this command to regenerate the DI files:
  ```bash
  flutter pub run build_runner build
- **Updating localization files**: 
  After updating localization files, use this command to regenerate localization resources:
  ```bash
  flutter gen-l10n
