# Capstone-RSD/rss-client

Capstone-RSD/rss-client is a Flutter mobile application that allows users to capture road sruface deteriorations they may encounter and upload their payload to an event streaming platform. It's a part of the Road Surface Deterioration Capstone project at Ontario Tech University.

The client is built with Flutter, which is a framework for building high-performance, cross-platform mobile applications. Built using FlutterFlow, it uses  the Provider package for state management and several Flutter plugins to handle things like image capturing and Shared Preferences to save users state.

## Getting Started

To run the app, you need to have Flutter and Dart installed on your system. Then, follow these steps:

1. Clone this repository and naviagate into the directory:
   ```sh
   git clone https://github.com/Capstone-RSD/rss-client.git && /
   cd rss-client
   ```
2. Install dependencies:

    **IMPORTANT:**

    For projects with Firestore integration, you must first run the following commands to ensure the project compiles:
    ```sh
    flutter pub get

    # generates files that parse each Record from Firestore into a schema object.
    flutter packages pub run build_runner build --delete-conflicting-outputs
    ```
3. Start the app:
    ```sh
    flutter run
    ```

This should launch the app on your default emulator or connected device. You can now interact with the app and make changes to the code. Feel free to use docker and devcontainers extension on vscode. **Note:** Both Docker and an Android device that supports wireless debugging are required to run the application

## Features

Capstone-RSD/rss-client includes the following features:

- **Authentication**: Users can create an account, log in, and log out of the app.

- **RSS Captures**: Users can utilize their devices camera to capture the road damage scene.

- **Online Storage**: The app uses a storage bucket to store RSS captures for inferencing.

- **User Interface**: The app has a clean and intuitive user interface, which utilizes Material Design.

## App Demo

[RSS Client App Demo Video](https://ontariotechu-my.sharepoint.com/:v:/g/personal/tiwaloluwa_ojo_ontariotechu_net/ER_Yb_IdaYxNqeG7sPDk5UwBgUcMqFsNRkLWqS2YYVKKaA?e=PwKmq0)

## Contributing

If you want to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch from the `main` branch for your changes.
3. Make your changes and commit them with clear commit messages.
4. Push your changes to your fork.
5. Create a pull request from your branch to the `main` branch of this repository.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
