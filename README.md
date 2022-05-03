# Home Train

Our app seeks to provide free, real-time feedback for basic exercises to improve the home workout experience. The pandemic created the need for individuals to do more home workouts, which meant that people needed to learn how to excercise by themselves. Currently, self-analyzing workout apps cost money, so we decided to bbuild an entirely free app that allows users to track their home workouts. 

## Functionality
The app includes two main features: workout detection and workout tracking. 

- Workout Detection: Utilizes computer vision technology to provide real-time feedback on the correctness of the users push-up and plank form. This technology was built using a TFLite model and thhe MoveNet library. 

- Workout Tracking: Fetches data from the firestore database and displays statistics on an interactive line graph for each workout. 

## Technical Architecture

<img width="900" alt="Screen Shot 2022-05-03 at 1 04 14 PM" src="https://user-images.githubusercontent.com/31574086/166515006-52298843-6371-474e-9984-405eb6d2ea65.png">


## Installation Instructions (Flutter) 

1. Download and install Flutter, can be installed in VSCode (https://docs.flutter.dev/get-started/install) 
2. Clone the github `git clone "https://github.com/CS222SP22/course-project-mem"`
3. Go into the home train directory `cd home_train`
4. Build + Run on web or physical mobile device (we reccomend web)
    - Web: `flutter pub get` `flutter run -d chrome --web-port 5000`
    - Mobile: 
      - Trust the device and make sure to trust the app. For iOS, [Settings -> General -> VPN & Device Management -> Trust]
      - `flutter pub get` `flutter run`

## Installation Instructions (TFLite) 

1. Download and install XCode 
2. Open the HomeTrain_IOS folder in XCode 
3. Navigate to the HomeTrain_IOS Directory 
4. Open an emulator or plug an iOS device in (plugging in a device is highly recommended) 
5. Run `pod install` 
6. Open the PoseEstimation Workspace and run the build 

