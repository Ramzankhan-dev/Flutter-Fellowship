# firebaseapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# 🔥 Firebase Chat App

A real-time chat application built with Flutter & Firebase.

## ✨ Features
- 🔐 Login & Register (Email/Password)
- 💬 Real-time messaging
- 🌙 Dark theme UI
- 🔒 Secure with Firebase Auth & Firestore Rules

---

## ⚙️ Setup (For New Developers)

### 1️⃣ Clone the project
```bash
git clone https://github.com/your-username/firebaseapp.git
cd firebaseapp
```

### 2️⃣ Install dependencies
```bash
flutter pub get
```

### 3️⃣ Firebase Setup
> `google-services.json` and `firebase_options.dart` are not included for security reasons.
> You need to generate them yourself.

**Step 1:** Go to [Firebase Console](https://console.firebase.google.com)

**Step 2:** Create a new project OR ask the owner to add you to existing project

**Step 3:** Add Android app with package name:
```
com.example.firebaseapp
```

**Step 4:** Download `google-services.json` and place it here:
```
android/app/google-services.json
```

**Step 5:** Install Firebase CLI & FlutterFire CLI:
```bash
npm install -g firebase-tools
firebase login
dart pub global activate flutterfire_cli
```

**Step 6:** Generate `firebase_options.dart`:
```bash
dart pub global run flutterfire_cli:flutterfire configure
```

### 4️⃣ Run the app
```bash
flutter run
```

---

## 📁 Project Structure
```
lib/
  main.dart             # App entry point
  login_screen.dart     # Login UI
  register_screen.dart  # Register UI
  chat_screen.dart      # Chat UI
```

---

## 🛡️ Security
- Firebase Auth — only registered users can access
- Firestore Rules — only logged-in users can read/write
- API keys are restricted to this app only

---

## 🤝 Contact
Made by **Muhhammad** — feel free to reach out for Firebase credentials!