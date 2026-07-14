# Flutter Week 2 – Data Management and Persistent Storage

This Flutter application was developed as part of the Flutter Internship Week 2 assignment and later enhanced using **Provider** for state management as part of the Week 6 tasks. The project demonstrates efficient state management using **Provider** and local data persistence using **SharedPreferences**. It includes a counter application and a simple To-Do List with persistent storage.

## Features

* Counter application with increment and decrement functionality
* State management using **Provider**
* Save and restore the counter value using `SharedPreferences`
* Add tasks to the To-Do List
* Delete tasks from the To-Do List
* Automatically save and load tasks using `SharedPreferences`
* Input validation to prevent adding empty tasks

## Technologies Used

* Flutter
* Dart
* Provider
* SharedPreferences

## Project Structure

```text
lib/
├── providers/
│   └── task_provider.dart
├── main.dart
├── screens/
│   └── home_screen.dart
└── services/
    └── storage_service.dart
```

## Installation & Setup

### Clone the repository

```bash
git clone https://github.com/afsheenn2024-sudo/flutter_week2_to-do_app.git
```

### Open the project

```bash
cd flutter_week2_to-do_app
```

### Install dependencies

```bash
flutter pub get
```

### Run the application

```bash
flutter run
```

## How to Use

1. Launch the application.
2. Increase or decrease the counter using the provided buttons.
3. Close and reopen the app to verify that the counter value is saved.
4. Add tasks to the To-Do List.
5. Delete tasks using the delete icon.
6. Restart the application to confirm that both the counter and tasks are loaded automatically.

## Testing

The application was tested to verify that:

* Counter value updates correctly using **Provider**.
* Counter value is saved and restored using `SharedPreferences`.
* Tasks can be added successfully.
* Tasks can be deleted successfully.
* Empty tasks cannot be added.
* Saved tasks remain available after restarting the application.
* The user interface updates automatically without using `setState()`.
