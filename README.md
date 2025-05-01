
# MediConnect – Video Conferencing App for Telemedicine and Healthcare

MediConnect is a mobile application developed as part of the **BME 4232 - Telemedicine** course at **Khulna University of Engineering & Technology (KUET)**. The app is designed to enable secure, real-time video consultations between healthcare professionals and patients. It integrates cutting-edge technologies like **Firebase** for authentication and **ZEGOCLOUD** for real-time communication.

## Features:
- **Sign Up & Sign In**: Secure user authentication with email and password using Firebase.
- **Video Calling**: High-quality, real-time video conferencing for telemedicine consultations.
- **Messaging**: Secure chat feature for seamless communication between doctors and patients.
- **Data Sharing**: Allows sharing of medical images, reports, and prescriptions during consultations.
- **Emergency Services**: Real-time telemedicine services for quick consultations in emergencies.
- **Secure Authentication**: Firebase Authentication and real-time database integration.
- **Multilingual Support**: Supports multiple languages, including English, Bangla, and Hindi.

## Technologies Used:
- **Android Studio**: IDE for Android app development.
- **Java**: Programming language used for app logic.
- **Firebase**: Provides secure authentication, real-time database services, and data storage.
- **ZEGOCLOUD**: Real-time communication SDK for video and voice calls, chat, and data sharing.

## Getting Started:

### Prerequisites:
1. **Android Studio**: Download and install Android Studio from [here](https://developer.android.com/studio).
2. **Firebase Project**: Create a Firebase project in the [Firebase Console](https://console.firebase.google.com/), configure it with your Android app, and add the `google-services.json` file to the project.
3. **ZEGOCLOUD Account**: Create a ZEGOCLOUD account at [ZEGOCLOUD](https://www.zegocloud.com/) and obtain your **appID** and **appSign**.

### Installation:
1. Clone the repository:
   ```bash
   git clone https://github.com/souravbasakshuvo/MediConnect-Video-Conferencing-App.git
   ```

2. Open the project in **Android Studio**.

3. Add your Firebase credentials (`google-services.json`) to the app's `app/` directory.

4. Integrate your **ZEGOCLOUD** credentials (appID and appSign) in the code.

5. Build and run the app on an emulator or a physical device.

## Usage:
- **Sign Up**: Create a new account or **Sign In** if you already have one.
- **Create Meeting**: Start a new video call with a unique meeting ID.
- **Join Meeting**: Enter a meeting ID to join an ongoing consultation.
- **Messaging**: Send messages and share medical data securely.

<!--
## Screenshots:
### Sign Up & Sign In:
![Sign Up](./screenshots/signup.png)
![Sign In](./screenshots/signin.png)

### Video Call Interface:
![Video Call](./screenshots/videocall.png)

### Chat Interface:
![Chat Interface](./screenshots/chatinterface.png)
-->

## Future Improvements:
- **Enhanced Security**: Add support for additional authentication methods like Google or Facebook login.
- **Improved Video Call Quality**: Enhance video call quality and introduce features like device switching and noise cancellation.
- **Better Telehealth Features**: Integrate more medical functionalities, such as monitoring health data from medical devices.
- **Email Verification**: Implement email verification during sign-up for added security.

## Acknowledgements:
- **Firebase**: For secure authentication, database, and storage services.
- **ZEGOCLOUD**: For providing a powerful SDK for real-time communication.
- **Android Studio**: For being an excellent development environment for Android apps.

## License:
This project is licensed under the MIT License – see the [LICENSE](LICENSE) file for details.
