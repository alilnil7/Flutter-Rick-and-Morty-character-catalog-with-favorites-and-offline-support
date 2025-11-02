# Rick and Morty Character Catalog

Flutter mobile application for browsing characters from the Rick and Morty universe with favorites functionality and offline support.

## 📱 Features

- **Character list** with pagination and infinite scroll
- **Add/remove favorites** with local storage
- **Offline access** to favorite characters
- **Sort favorites** by name or status
- **Search functionality** (optional)
- **Dark theme support** (optional)

## 🛠 Tech Stack

- **Flutter** 3.35.7
- **Dart** 3.9.2
- **State Management**: BLoC/Cubit
- **Local Database**: Hive
- **HTTP Client**: Dio
- **Image Caching**: cached_network_image
- **Navigation**: Flutter Navigator

## 🏗 Architecture

The app follows Clean Architecture with clear separation of concerns:

#### **Data Layer** (`/data`)
Handles data operations and sources:
- **Models** (`/models`) - Data classes and Hive adapters
- **Repositories** (`/repositories`) - API communication and data coordination
- **Local** (`/local`) - Hive database for local storage

#### **Business Logic Layer** (`/business_logic`)
Manages application state and business rules:
- **Cubits** - State management using BLoC pattern
- **States** - Immutable state classes
- **Character List** - Handles character loading, pagination, and filtering
- **Favorites** - Manages favorites operations and sorting

#### **Presentation Layer** (`/presentation`)
UI components and screens:
- **Screens** (`/screens`) - Main app screens (Character List, Favorites)
- **Widgets** (`/widgets`) - Reusable UI components (CharacterCard)

### Data Flow
1. **UI triggers** event in Cubit
2. **Cubit processes** business logic and updates State
3. **Repository fetches** data from API or local storage
4. **State change triggers** UI rebuild
5. **User sees** updated interface

### Key Principles
- **Separation of Concerns** - Each layer has distinct responsibility
- **Testability** - Business logic independent of UI
- **Maintainability** - Clear boundaries between features
- **Scalability** - Easy to add new features

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.19.0 or higher
- Dart SDK 3.3.0 or higher

# Rick and Morty Flutter App

A mobile application for browsing Rick and Morty characters with favorites and offline support.

## 🚀 Quick Start

### 1. Clone the repository
```bash
git clone https://github.com/alilnil7/Flutter-Rick-and-Morty-character-catalog-with-favorites-and-offline-support.git
2. Go to project directory
bash
cd Flutter-Rick-and-Morty-character-catalog-with-favorites-and-offline-support
3. Install dependencies
bash
flutter pub get
4. Generate Hive code (required)
bash
flutter packages pub run build_runner build --delete-conflicting-outputs
5. Run the app
bash
flutter run
When prompted, select a device:

2: Chrome (recommended)

3: Edge

1: Windows (requires Developer Mode)

###📱 Features
Character list with pagination

Add/remove favorites with local storage

Offline support for favorites

Sort favorites by name or status

Clean UI with Material Design

### 🛠 Tech Stack
Flutter 3.35.7 • Dart 3.9.2

State Management: BLoC/Cubit

Local Database: Hive

HTTP Client: Dio

Image Caching: cached_network_image

🔧 Build Commands
Run in browser
bash
flutter run -d chrome
Build APK
bash
flutter build apk --release
Build Web
bash
flutter build web --release
📁 Project Structure
text
lib/
├── data/              # Data layer
├── business_logic/    # BLoC states & cubits
└── presentation/      # UI screens & widgets
### 🎯 API
Uses Rick and Morty API

GET /character - get characters list

GET /character?page={page} - pagination

###❓ Troubleshooting
White screen in browser?
Open Developer Tools (F12)

Check Console for errors

Try different CORS proxy in character_repository.dart

Code generation fails?
bash
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
👨‍💻 Author
Alibe

GitHub: @alilnil7

