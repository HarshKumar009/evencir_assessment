# Evencir Assessment - Fitness & Mood Tracker

I made this Flutter app to track fitness and mood, focusing on making the UI pixel-perfect based on the Figma design.
## 1. Dependencies Used & Why

- **flutter_riverpod**: Used for global state management to handle navigation, weather data, and app-wide states efficiently.
- **intl**: Essential for dynamic date formatting, calculating week ranges, and managing the calendar logic in the Plan screen.
- **google_fonts**: Used to implement the **Mulish** font family, ensuring the typography matches the Figma design exactly.
- **flutter_screenutil**: Implemented to make the UI fully responsive, allowing the pixel-perfect design to scale across different device sizes.
- **shared_preferences**: Used for local data persistence, enabling the "Save" functionality so workout plans remain saved after app restarts.

## 2. Project Structure

The project follows a **Feature-based Clean Architecture** to ensure separation of concerns and maintainability:

```text
lib/
 ├── core/               # Shared utilities, constants, and date formatters
 ├── features/           # Modular feature-based structure
 │    ├── home/          # Dashboard features and health insights
 │    ├── plan/          # Training Calendar and Drag & Drop logic
 │    └── mood/          # Interactive Mood Wheel and background effects
 │         ├── data/          # Repositories (Shared Preferences logic)
 │         ├── domain/        # Models (Workout and Mood objects)
 │         └── presentation/  # UI (Pages, Widgets, Controllers, and Painters)
 └── main.dart           # Entry point and global provider setup
 
```

Architecture Breakdown

- Models: Defines data blueprints.
- Views/Pages: Main screen containers for each feature.
- Widgets: Reusable UI components.
- Controllers: Business logic handling using ChangeNotifier and Riverpod.
- Painters: Custom graphics logic for the interactive and blurry Mood Wheel segments.


3. App Screenshots

(https://github.com/HarshKumar009/evencir_assessment/tree/master/main/screenshots)

4. App Video

(https://drive.google.com/file/d/1zFHHlOiqoVv39e4wH8NC4iuzddSHhLs0/view?usp=sharing)

5. App APK

(https://github.com/HarshKumar009/evencir_assessment/tree/master/releases/download/v1.0)

## Features

- Health Dashboard with insights  
- Drag & Drop Training Calendar  
- Persistent Workout Plans  
- Interactive Mood Selector  
- Responsive UI (All screen sizes supported)


## 👨‍💻 Author

**Harsh Kumar**  
