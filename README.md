# 🚀 E-Commerce Admin Panel - Nexus

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com)
[![GetX](https://img.shields.io/badge/GetX-8C4FFF?style=for-the-badge&logo=get&logoColor=white)](https://pub.dev/packages/get)

Welcome to the **Nexus E-Commerce Admin Panel**, a powerful, responsive, and aesthetically pleasing management dashboard built with Flutter. This panel provides a seamless interface for administrators to manage products, categories, banners, and users with real-time Firebase integration.

---

### 🌟 Key Features

*   **📊 Insightful Dashboard**: Real-time stats and analytics using high-quality charts.
*   **🖼️ Media Manager**: Centralized location to upload and manage all application assets.
*   **📂 Category Management**: Organize products into logical hierarchies efficiently.
*   **🏴 Live Banners**: Dynamic banner management to boost platform engagement.
*   **🛡️ Secure Authentication**: Robust login system with "Remember Me" and Lottie loading states.
*   **📱 Fully Responsive**: Optimized for Desktop, Tablet, and Mobile layouts.

---

### 🔑 Demo Credentials

To explore the administration features, use the following testing credentials:

| Type | Credential |
| :--- | :--- |
| **Email** | `test@gmail.com` |
| **Password** | `Admin@123` |

---

### ✨ User Experience & Animations

This project leverages **Lottie Animations** to provide a premium feel. We use several specialized animations defined in `RImages`:

*   **Docer Animation**: A smooth loading sequence used during the authentication process to keep users engaged.
*   **Loading Juggle**: Displayed during data fetching to indicate system activity.
*   **Success Check**: High-finesse feedback for successful operations.

---

### 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev)
- **State Management**: [GetX](https://pub.dev/packages/get_x)
- **Backend / DB**: Firebase Auth, Firestore, Cloud Storage
- **Charts**: [FL Chart](https://pub.dev/packages/fl_chart)
- **Icons**: Iconsax & Cupertino Icons
- **Animations**: Lottie for high-performance vector animations

---

### 📂 Folder Structure

```
lib/
 ├── bindings/             # Global dependency injections
 ├── common/               # Shared widgets (loaders, headers, sidebar)
 ├── data/                 # Repositories and providers
 ├── features/             # Feature-based architecture (Auth, Dashboard, etc.)
 ├── localization/         # Multi-language and network management
 ├── routes/               # App routing and navigation
 └── utils/                # Constants, themes, and helper functions
```

---

### 🚀 Getting Started

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/your-repo/ecommerce_admin_panel.git
    ```
2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```
3.  **Run the application**:
    ```bash
    flutter run -d chrome
    ```

---

### 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/your-repo/ecommerce_admin_panel).

---

Developed with ❤️ by **Rahul Kashyap**
