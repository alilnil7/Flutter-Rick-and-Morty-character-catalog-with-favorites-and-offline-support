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

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/alilnil7/Flutter-Rick-and-Morty-character-catalog-with-favorites-and-offline-support.git
   cd Flutter-Rick-and-Morty-character-catalog-with-favorites-and-offline-support
Install dependencies

bash
flutter pub get
Generate Hive adapters

bash
flutter packages pub run build_runner build --delete-conflicting-outputs
Run the application

bash
flutter run
Available Platforms
✅ Android (emulator or physical device)

✅ iOS (requires macOS)

✅ Web (Chrome, Edge, Safari)

✅ Windows (requires Developer Mode)

📖 Usage
Main Screen
Browse all Rick and Morty characters

Scroll to load more characters (pagination)

Tap heart icon to add/remove from favorites

Pull to refresh the list

Favorites Screen
View all favorite characters

Sort by name or status using the menu in AppBar

Characters persist locally and available offline

🔧 Building
Android APK
bash
flutter build apk --release
App Bundle
bash
flutter build appbundle --release
Web Version
bash
flutter build web --release
🎯 Implementation Details
State Management
Uses BLoC/Cubit pattern for predictable state management

Separate cubits for character list and favorites

Reactive UI updates with BlocBuilder

Local Storage
Hive for fast NoSQL local storage

Favorites persist between app sessions

Data caching for offline functionality

Network Layer
Dio for HTTP requests with error handling

CORS proxy support for web version

Pagination implementation with infinite scroll

UI/UX
Material Design 3 components

Responsive layout

Intuitive navigation with BottomNavigationBar

Loading states and error handling

🔌 API
The app uses The Rick and Morty API:

Endpoints:

GET /character - Get character list

GET /character?page={page} - Pagination

GET /character?name={name} - Search characters

🐛 Troubleshooting
Common Issues
White screen in browser:

Check browser console for CORS errors

Try different CORS proxy in character_repository.dart

Code generation fails:

bash
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
Hive initialization errors:

Ensure Hive adapters are properly generated

Check Hive type IDs in model classes

🤝 Contributing
Fork the project

Create your feature branch (git checkout -b feature/AmazingFeature)

Commit your changes (git commit -m 'Add some AmazingFeature')

Push to the branch (git push origin feature/AmazingFeature)

Open a Pull Request

📄 License
This project is created as a test task implementation. The Rick and Morty API is provided for free.

👨‍💻 Author
Alibe

GitHub: @alilnil7

