# 💬 Chat App

A real-time Flutter Chat App with **Firebase** authentication and live messaging. Multiple users can register, login, and chat together in a shared Chat Room!

---

## 📸 Screenshots

<table>
  <tr>
    <td align="center"><b>Login Screen</b></td>
    <td align="center"><b>Register Screen</b></td>
    <td align="center"><b>Chat Room</b></td>
  </tr>
  <tr>
    <td><img src="chat_login.jpeg" width="200"/></td>
    <td><img src="chat_register.jpeg" width="200"/></td>
    <td><img src="chat_room.jpeg" width="200"/></td>
  </tr>
</table>

---

## 🚀 Features

- 🔐 User Registration with Email & Password
- 🔑 User Login with Firebase Authentication
- 💬 Real-time Chat Room — all users chat together
- 📨 Messages show sender email + timestamp
- 🟣 Your messages shown on right (purple bubble)
- 🔵 Others' messages shown on left (dark bubble)
- 🚪 Logout button in AppBar
- 🌙 Dark theme with purple accent

---

## 🛠️ Tech Stack

| Technology | Usage |
|---|---|
| **Flutter** | UI Framework |
| **Firebase Auth** | User Login & Register |
| **Firebase Firestore** | Real-time messages storage |

---

## ⚙️ Setup

### 1. Clone the repo
```bash
git clone https://github.com/Ramzankhan-dev/Flutter-Fellowship.git
cd Flutter-Fellowship/chatapp
```

### 2. Install dependencies
```bash
flutter pub get
```

### 3. Firebase Setup
- Go to [Firebase Console](https://console.firebase.google.com/)
- Create a new project
- Enable **Authentication** → Email/Password
- Enable **Cloud Firestore**
- Download `google-services.json` → paste in `android/app/`
- Run the app

### 4. Run the app
```bash
flutter run
```

---

## 📁 Project Structure

```
lib/
├── main.dart           # App entry point, Firebase init
├── login_screen.dart   # Login UI with email & password
├── register_screen.dart # Register UI with confirm password
└── chat_screen.dart    # Real-time chat room
```

---

## 📦 Dependencies

```yaml
dependencies:
  firebase_core: latest
  firebase_auth: latest
  cloud_firestore: latest
```

---

## 👨‍💻 Author

**Ramzan** — Flutter Developer

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).