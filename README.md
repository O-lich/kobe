# 🕒 KOBE Timer

**KOBE Timer** is a beautiful and customizable interval timer for workouts, focus sessions, and mindfulness practices.  
Built with ❤️ using Flutter, it's designed to be minimal, responsive, and delightful to use.

---

## 📱 Features

- ⏱️ **HIIT, Yoga, Focus, and Circuit modes**
- 🧘 Customizable intervals for warm-up, work, rest, cooldown, and number of rounds
- 🧭 Clean navigation with GoRouter
- 🎨 Modern UI with gradient buttons and SVG illustrations
- 🧠 Offline support using `shared_preferences` (local only for now)
- 📦 Modular architecture with clear separation by feature

---

## 🛠️ Tech Stack

- **Flutter** 3.x
- **GoRouter** for navigation
- **Shared Preferences** for local persistence
- **Google Fonts** & **flutter_svg** for UI polish
- **MVC-ish** feature-based folder structure

---

## 🚀 Getting Started

### 1. Clone the repo

```bash
git clone https://github.com/your-user/kobe.git
cd kobe
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Run the app

```bash
flutter run
```

---

## 🧱 Folder Structure

```
lib/
├── core/             # Shared configs, colors, strings, assets
├── features/
│   ├── home/         # Home screen
│   ├── hiit/         # HIIT setup, models
│   └── ...           # Future: yoga, focus, circuit
├── router/           # App-wide routing
├── widgets/          # Shared UI components
└── main.dart         # Entry point
```

---

## 📸 UI Preview

<img src="https://github.com/user-attachments/assets/e8cdfa2e-04df-4cb3-81ae-2b1ea646634d" height="400"/>

<img src="https://github.com/user-attachments/assets/0a9d2f02-e63e-4519-b45f-6b5456c9b43f" height="400"/>


---

## ✅ Todo

- [ ] Add timer execution screen with audio & vibration
- [ ] Add favorites & settings functionality
- [ ] Support for Apple Watch sync (future)
- [ ] Localizations (EN/RU)

---

## 📄 License

This project is licensed under the MIT License.
