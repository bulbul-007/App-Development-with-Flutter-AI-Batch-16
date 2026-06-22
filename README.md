# Personal Profile Card App

A clean, modern, and responsive Flutter application showcasing a Personal Profile Card with interactive buttons and a grid-based Interests section.

## 📱 Visual Output

Below is the profile image used at the top of the card:

<p align="center">
  <img src="c:\Users\HP\OneDrive\Pictures\Screenshots\Screenshot 2026-06-22 152549.png" alt="Profile Picture" width="180" style="border-radius: 50%; border: 4px solid #006EE6; box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.15);"/>
</p>

---

## 🛠️ Widget Structure & Architecture

The application has been structured cleanly inside a single screen following the recommended hierarchy:

```
MaterialApp
└── Scaffold
    └── SafeArea
        └── SingleChildScrollView
            └── Column
                ├── Card (Profile Card)
                │   └── Column
                │       ├── CircleAvatar (Profile Image)
                │       ├── Name (BULBUL AHMED)
                │       ├── Profession (Flutter Developer)
                │       ├── Bio Text
                │       ├── Divider
                │       ├── Email Row (Icon + Text)
                │       ├── Phone Row (Icon + Text)
                │       └── Buttons Row
                │           ├── Follow Button (Elevated)
                │           └── View Profile Button (Outlined)
                ├── Divider Header ("Interests")
                └── Row (Interests Cards)
                    ├── Travel Card (Image + Details + Button)
                    └── Photography Card (Image + Details + Button)
```

---

## ✨ Features Implemented

1. **Stateful Follow Button**:
   - Changes dynamically between **Follow** and **Following** when clicked using `setState()`.
   - Displays a descriptive `SnackBar` at the bottom of the screen.
2. **View Profile Alert Dialog**:
   - Displays a styled pop-up custom dialog containing Name, Profession, Email, Phone, and Bio.
   - Includes a custom-styled close button.
3. **Interests Section**:
   - Clean divided section showing cards with cover images (Travel & Photography).
   - "View More" actions to view details in a dialog.
4. **Professional UI Styling**:
   - High-quality Material 3 design, custom elevations, soft shadows, rounded corners (`BorderRadius.circular(16)`), and responsive layout.

---

## 🚀 Installation & Running

1. **Get Dependencies**:
   ```bash
   flutter pub get
   ```
2. **Run the App**:
   ```bash
   flutter run
   ```


