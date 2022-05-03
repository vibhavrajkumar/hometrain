# Home Train

Our app seeks to provide free, real-time feedback for basic exercises to improve the home workout experience. The pandemic created the need for individuals to do more home workouts, which meant that people needed to learn how to excercise by themselves. Currently, self-analyzing workout apps cost money, so we decided to bbuild an entirely free app that allows users to track their home workouts. 

## Functionality
The app includes two main features: workout detection and workout tracking. 

- Workout Detection: utilizes computer vision technology to determine the correctness of the users push-ups, planks, sit-ups, and squats, and will only increment thhe reps/time when they have proper form. This technology was built using a TFLite model and thhe MoveNet library. 

- Workout Tracking: Fetches data from the firestore database and displays statistics on an interactive line graph for each workout. 

##Technical Architecture

<img width="900" alt="Screen Shot 2022-05-03 at 1 04 14 PM" src="https://user-images.githubusercontent.com/31574086/166515006-52298843-6371-474e-9984-405eb6d2ea65.png">


## Installation Instructions

1. Clone the gihub `git clone "https://github.com/CS222SP22/course-project-mem"`
2. Go into the home train directory `cd home_train`
3. Run the appropriate emulator or connect to a physical mobile device
4. Build and run the app `flutter pub get` `flutter run`
