# 🚀 RocketsX

## 📌 Features

- Splash screen with Google Sign-In via Firebase
- Rocket list screen (UIKit)
- Rocket launches screen (SwiftUI with pagination)
- Local data caching using SwiftData
- All external links open inside the app
- Offline support
- Full localization support

## 🧱 Architecture

The project follows **Clean Architecture** with modular separation:
- Presentation
- Domain
- Data

Dependency Injection is handled via a custom DI container.

## ⚙️ Technologies

- Swift, SwiftUI, UIKit (no Storyboards)
- Firebase Auth (Google SSO)
- SwiftData (local caching)
- Alamofire / URLSession
- SwiftGen (assets, strings)
- SwiftLint (code style)
- Async/Await
- GitFlow branching strategy

## ▶️ How to Run

1. Clone the repository:
```bash
git clone https://github.com/your-username/RocketsX.git
cd RocketsX

2. Resolve dependencies:
swift package resolve
