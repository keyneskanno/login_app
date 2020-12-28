# loginflutterapp

This app only make login to firebase.

## Getting Started

This project require google-services.json file. It does not include google-services.json because it contains confidential information to get access to cloud firebase. Follow these steps - https://firebase.google.com/docs/android/setup?hl=pt-br - Pay attention to step 3. Include google-services.json file in this directory:  logginapp/android/app/


## Recommended versions

### pubspec.yaml:

flutter_staggered_grid_view: ^0.3.0

cloud_firestore: ^0.12.9

carousel_pro: ^1.0.0

transparent_image: ^1.0.0

scoped_model: ^1.0.1

firebase_auth: ^0.11.1+12

url_launcher: ^5.1.1

### build.gradle:

classpath 'com.android.tools.build:gradle:3.3.0'

classpath 'com.google.gms:google-services:4.3.0'
