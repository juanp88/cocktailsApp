# 🍹 CocktailHub

A modern, beautifully designed Flutter application for discovering and exploring cocktail recipes. Built with clean architecture principles and featuring a stunning UI with smooth animations.

## ✨ Features

### 🏠 **Modern Home Screen**
- Beautiful gradient backgrounds with glass-morphism effects
- Intuitive category navigation with animated cards
- Smart search functionality with custom styling
- Responsive design that adapts to all screen sizes

### 🍸 **Drink Categories**
- **Ordinary Drinks**: Classic drinks for every occasion
- **Cocktails**: Premium cocktails & mixed drinks
- Dynamic grid layouts with smooth loading states
- Real-time drink count statistics

### 📱 **Drink Details**
- Stunning hero image displays with parallax scrolling
- Comprehensive ingredient lists with measurements
- Step-by-step preparation instructions
- Glass type recommendations
- Modern card-based information layout

### 🔍 **Smart Search**
- Real-time search with custom animations
- Smooth page transitions with scale effects
- Search result filtering and display

### 🎨 **UI/UX Excellence**
- Modern Material Design 3 principles
- Consistent color theming (Orange for Ordinary, Pink for Cocktails)
- Smooth animations and micro-interactions
- Glass-morphism and gradient effects
- Responsive typography hierarchy

## 🏗️ Architecture

This app follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── config/                 # App configuration
│   ├── api_constants.dart   # API endpoints and constants
│   └── app_constants.dart   # UI constants and themes
├── domain/                 # Business logic layer
│   └── entities/           # Data models
├── presentation/           # UI layer
│   ├── controllers/        # State management (Riverpod)
│   ├── pages/             # Screen widgets
│   └── widgets/           # Reusable UI components
└── main.dart              # App entry point
```

### 🧩 **Key Components**

#### **Reusable Widgets**
- `CategoryCard` - Animated category selection cards
- `DrinkListHeader` - Consistent page headers with navigation
- `DrinkStatsSection` - Dynamic statistics display
- `ErrorStateWidget` - User-friendly error handling
- `LoadingStateWidget` - Branded loading indicators
- `GridViewList` - Modern drink grid with smooth animations

#### **State Management**
- **Riverpod** for reactive state management
- Future providers for async data fetching
- Auto-dispose providers for memory efficiency

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (2.17.0 or higher)
- Android Studio / VS Code
- iOS development setup (for iOS builds)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/cocktails_app.git
   cd cocktails_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Platform Requirements

#### Android
- **Minimum SDK**: 21 (Android 5.0)
- **Target SDK**: 35 (Android 15)
- **Gradle**: 8.8
- **Android Gradle Plugin**: 8.3.0
- **Kotlin**: 1.8.10

#### iOS
- **Minimum iOS Version**: 12.0
- **Swift Version**: 5.0
- **Xcode**: 12.0 or higher

## 🌐 API Integration

The app integrates with **TheCocktailDB API** to fetch:
- Cocktail and drink data
- High-quality drink images
- Detailed recipes and ingredients
- Category-based filtering

### Network Configuration
- Android: Network security configured for HTTP requests
- iOS: App Transport Security configured for API access

## 🎯 Key Technical Highlights

### **Performance Optimizations**
- Efficient image loading with error handling and placeholders
- Auto-disposing providers to prevent memory leaks
- Optimized grid layouts with proper aspect ratios
- Smooth animations with proper curve implementations

### **User Experience**
- Consistent loading states across all screens
- Comprehensive error handling with retry mechanisms
- Smooth page transitions with custom animations
- Responsive design for various screen sizes

### **Code Quality**
- Clean Architecture implementation
- Separation of concerns with standalone widget classes
- Consistent naming conventions
- Proper error handling and edge cases

## 📦 Dependencies

### Core Dependencies
```yaml
flutter_riverpod: ^2.4.9    # State management
http: ^1.1.0               # HTTP requests
```

### UI Dependencies
```yaml
bordered_text: ^2.0.0      # Text styling effects
```

## 🔧 Development

### Project Structure
The app follows Flutter best practices with:
- Modular widget architecture
- Consistent theming system
- Proper state management patterns
- Clean separation between UI and business logic

### Adding New Features
1. Create new entities in `domain/entities/`
2. Add API endpoints to `config/api_constants.dart`
3. Create reusable widgets in `presentation/widgets/`
4. Implement pages in `presentation/pages/`
5. Add state management in `presentation/controllers/`

## 🚀 Building for Production

### Android
```bash
flutter build apk --release
# or for app bundle
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **TheCocktailDB** for providing the comprehensive cocktail API
- **Flutter Team** for the amazing framework
- **Riverpod** for excellent state management
- **Material Design** for design inspiration

## 📱 Screenshots

*Add screenshots of your app here to showcase the beautiful UI*

---

**Built with ❤️ using Flutter**
