# Task Manager App – Flutter CRUD App with Back4App (BaaS)

## Project Overview

This is a Flutter-based Task Manager application that uses Back4App (Parse Server) as a Backend-as-a-Service (BaaS).
The app supports:

    User Registration & Login

    Create / Read / Update / Delete (CRUD) Tasks

    Cloud database storage using Back4App

    User Logout

    Real-time syncing (on refresh)

## Features

User Authentication

    Register using Student Email ID

    Login using email + password

    Session is stored securely by Back4App

Task CRUD

    Add task (title + description)

    View all tasks

    Edit task

    Delete task

    Data stored in Back4App Cloud Database

Other

    Clean UI

    Cloud backend (no server code needed)

    Parse SDK integration

    Logout


## Tech Stack

    Frontend: Flutter (Dart)

    Backend: Back4App (Parse Server)

    Database: Back4App Cloud Database

    Version Control: GitHub

    Hosting: Local device / emulator / Chrome

## Folder Structure

lib/
 ┣ main.dart
 ┣ screens/
 ┃ ┣ login_screen.dart
 ┃ ┣ register_screen.dart
 ┃ ┣ tasks_screen.dart
 ┃ ┗ add_edit_task_screen.dart
 ┣ services/
 ┃ ┣ auth_service.dart
 ┃ ┗ task_service.dart


## Setup Instructions
1. Clone the Repository
```
git clone https://github.com/DevMonisha/Task-Manager-Flutter-App.git
cd your-project
```
2. Install Packages
```
flutter pub get
```
3. Add Parse Keys to .env

Create .env file:
```
PARSE_APPLICATION_ID=MU35mSQ470LY81alNLNsgnrM84cE060kpyOUeh7O
PARSE_CLIENT_KEY=MgosptRUHlnuYTUdn6NIfKUdbxiggrQWRtrNjvBM
PARSE_SERVER_URL=https://parseapi.back4app.com/
```
4. Run the App
```
flutter run -d chrome
```