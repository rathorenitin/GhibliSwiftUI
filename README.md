# GhibliSwiftUI

A SwiftUI app that showcases Studio Ghibli movies with a clean architecture approach, modern SwiftUI UI, and local favorite persistence.

![GhibliSwiftUI Demo](GhibliSwiftUI.gif)

## Features

- Browse a list of Studio Ghibli movies
- View detailed movie information and characters
- Mark movies as favorites and persist them locally
- Navigate between Movies and Favorites tabs
- Built using SwiftUI with a clean, modular structure

## Architecture

The project follows a feature-based clean architecture structure:

- App layer for app entry and coordinator setup
- Features for Movies, MoviesDetail, Favorites, and TabBar
- Common reusable UI components and shared state helpers
- Network layer for API communication

## Tech Stack

- SwiftUI
- Swift 6
- iOS 17+
- Observation framework
- Async/Await
- UserDefaults for local persistence

## Project Structure

```text
GhibliSwiftUI/
├── App/
├── Common/
├── Coordinator/
├── Features/
│   ├── Favorites/
│   ├── Movies/
│   ├── MoviesDetail/
│   └── TabBar/
└── Network/
```

## Getting Started

1. Clone the repository
   ```bash
   git clone https://github.com/your-username/GhibliSwiftUI.git
   ```
2. Open the Xcode project:
   ```bash
   open GhibliSwiftUI/GhibliSwiftUI.xcodeproj
   ```
3. Build and run the app on a simulator or device

## Requirements

- Xcode 16+
- iOS 17+
- Swift 6

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.