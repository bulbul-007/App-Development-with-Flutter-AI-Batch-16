# Personal Profile Card App

A modern, clean, and responsive Flutter application that displays a personal profile card with interactive elements, styled to match premium design specifications.

## 📱 Preview
<p align="center">
  <img src="https://cdn.ostad.app/user/avatar/2025-12-28T11-05-54.599Z-IMG_20250907_125558.jpg" alt="Profile Picture" width="150" style="border-radius: 50%"/>
</p>

---

## ✨ Features

- **Profile Card Section**:
  - Centered professional profile picture using a `CircleAvatar`.
  - Clean typography for the name, profession, and bio.
  - Interactive **Follow** button (`StatefulWidget` using `setState`) with instantaneous snackbar alerts.
  - **View Profile** button displaying detailed profile statistics in a styled `AlertDialog`.
  - Icon-supported contacts for Email and Phone numbers.
- **Interests Section**:
  - Custom section header with split dividers.
  - Twin card layout highlighting interests: **Travel** and **Photography**.
  - Custom "View More" dialogue actions for each interest.

---

## 🛠️ Flutter Concepts Demonstrated

- **StatelessWidget** & **StatefulWidget**
- State management utilizing `setState()`
- Material 3 `Card`, `ElevatedButton`, and `OutlinedButton` design
- `SnackBar` and `AlertDialog` component implementation
- Network image loading via `Image.network` and `NetworkImage`
- Custom typography, styling, padding, and spacing configurations

---

## 🚀 Getting Started

To run this project locally, ensure you have Flutter installed.

1. **Clone the repository**:
   ```bash
   git clone https://github.com/bulbul-007/App-Development-with-Flutter-AI-Batch-16.git
   cd "Personal Profile Card App"
   ```

2. **Get dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```

