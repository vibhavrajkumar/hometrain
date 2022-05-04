# Home Train

Our app seeks to provide free, real-time feedback for basic exercises to improve the home workout experience. The pandemic created the need for individuals to do more home workouts, which meant that people needed to learn how to excercise by themselves. Currently, self-analyzing workout apps cost money, so we decided to bbuild an entirely free app that allows users to track their home workouts. 

## Functionality
The app includes two main features: workout detection and workout tracking. 

- Workout Tracking: Utilizes computer vision technology to provide real-time feedback on the correctness of the users push-up and plank form. This technology was built using a TFLite model and thhe MoveNet library. 

- Workout Analytics: Fetches data from the firestore database and displays statistics on an interactive line graph for each workout. 

## Technical Architecture

<img width="900" alt="Screen Shot 2022-05-03 at 1 04 14 PM" src="https://user-images.githubusercontent.com/31574086/166515006-52298843-6371-474e-9984-405eb6d2ea65.png">
<img width="900" alt="Screen Shot 2022-05-03 at 8 58 51 PM" src="https://user-images.githubusercontent.com/31574086/166613898-29b525c8-78c5-431c-b5c1-8d958725f297.png">
<img width="900" alt="Screen Shot 2022-05-03 at 8 59 01 PM" src="https://user-images.githubusercontent.com/31574086/166613905-01308961-4aed-4c5a-8841-4fb3b4725bfc.png">
<img width="900" alt="Screen Shot 2022-05-03 at 8 59 13 PM" src="https://user-images.githubusercontent.com/31574086/166613913-1eeaa202-50ac-49c8-a714-67c2843e3ad1.png">

## How The Files Are Organized:
* `HomeTrain_iOS` is the native iOS TFLite code. It is built off of the [PoseNet Example Code](https://github.com/tensorflow/examples/tree/master/lite/examples/pose_estimation/ios)
        -  The model + set up is contained in `ML`
        -  The UI and modifications are contained in `UI`
        -  The main logical components are contained in `Views` & `ViewController`
        -  Pods contains necessary dependencies 
* `home_train` contains the dart code and UI
        - `web`, `iOS`, and `android` contain platform-specific dependencies and code
        - `pubspec.yaml` contains the necessary dependencies
        - `lib` has the running code, with main, constants and other important dart code
            - `screens` contains each screen view
            - `components` contains widgets/functions/components that are important
* Things that aren't mentioned are boilerplate/dependency documents or assets

## Installation Instructions (Flutter) 

1. Download and install Flutter, can be installed in VSCode (https://docs.flutter.dev/get-started/install) 
2. Clone the github `git clone "https://github.com/CS222SP22/course-project-mem"`
3. Go into the home train directory `cd home_train`
4. Build + Run on web or physical mobile device (we reccomend web)
    - Web: `flutter pub get` `flutter run -d chrome --web-port 5000`
    - Mobile: 
      - Trust the device and make sure to trust the app. For iOS, [Settings -> General -> VPN & Device Management -> Trust]
      - On Android, enable Trust USB Debugging
     - Run `flutter pub get` and `flutter run` on computer

## Installation Instructions (TFLite) 

1. Download and install XCode 
2. Open the HomeTrain_IOS folder in XCode 
3. Navigate to the HomeTrain_IOS Directory 
4. Open an emulator or plug an iOS device in (plugging in a device is highly recommended) 
5. Run `pod install` 
6. Open the PoseEstimation Workspace and run the build 
7. Make sure your entire body is captured within the camera screen 
   for optimal performance when trying a push-up or a plank (at the least, shoulders to ankles)

