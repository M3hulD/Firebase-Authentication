Flutter Firebase Authentication with Email and Google Sign-In
This Flutter application demonstrates how to implement Firebase Authentication using email and Google Sign-In in Flutter. The app uses Firebase Authentication to authenticate users with their email and password or through Google Sign-In.

The app consists of two screens:

Login Screen: This screen allows users to authenticate with their email and password or through Google Sign-In.
Home Screen: This screen is displayed after a successful login and displays the user's name and email.
Getting Started
Before running this app, please make sure you have created a Firebase project and added the Google Services configuration files to the project.

To run the app, please follow these steps:

Clone this repository using git clone https://github.com/your_username/your_repository.git.
Open the project in your preferred IDE.
Open a terminal and navigate to the project directory.
Run flutter pub get to install the necessary dependencies.
Run flutter run to start the app.
Configuring Firebase
To use Firebase Authentication in your app, you must first create a Firebase project and add the necessary configuration files to your app.

Create a new Firebase project in the Firebase console.
Add Firebase Authentication to your project in the Firebase console.
Download the google-services.json configuration file from the Firebase console and add it to the android/app/ directory in your project.
Download the GoogleService-Info.plist configuration file from the Firebase console and add it to the ios/Runner/ directory in your project.
Dependencies
This app uses the following dependencies:

firebase_auth - The Firebase Authentication library for Flutter.
google_sign_in - A Flutter plugin for Google Sign-In.
flutter_bloc - A state management library for Flutter.
flutter_bloc_helpers - A set of helper classes and widgets for Flutter Bloc.
License
This project is licensed under the MIT License. See the LICENSE file for details.
