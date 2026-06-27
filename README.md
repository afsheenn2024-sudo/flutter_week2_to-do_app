# Flutter Week 2 – Data Management and Persistent Storage

This Flutter application was developed as part of the Flutter Internship Week 2 assignment. The project demonstrates basic state management using `setState` and local data persistence using `SharedPreferences`. It includes a counter application and a simple To-Do List with persistent storage.

## Features

* Counter application with increment and decrement functionality
* State management using `setState`
* Save and restore the counter value using `SharedPreferences`
* Add and display tasks in a To-Do List
* Automatically save and load tasks using `SharedPreferences`

## Technologies Used

* Flutter
* Dart
* SharedPreferences

## Project Structure

```text
lib/
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
5. View the list of saved tasks.
6. Restart the application to confirm that tasks are loaded automatically.

## Testing

The application was tested to verify that:

* Counter value updates correctly using `setState`.
* Counter value is saved and restored using `SharedPreferences`.
* Tasks can be added successfully.
* Tasks are displayed correctly in the list.
* Saved tasks remain available after restarting the application.
