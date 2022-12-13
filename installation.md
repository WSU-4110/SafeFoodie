# Installation Instructions

For downloading and testing this software, you will need Android Studio with an Emulator with API 29. Android Studio can be downloaded at https://developer.android.com/studio 

Then, download flutter and update a path to your flutter SDK in your system environment. This can be downloaded at: https://docs.flutter.dev/get-started/install 
1. search your computer for "env" and click on edit the system environment variables
2. Click on "Environment Variables..."
3. in User Variables, double click on Variable "Path"
4. Copy and Paste your file path to your flutter bin file
5. Exit
6. Run "flutter doctor" in terminal

Set up your editor - VS Code is strongly encouraged!
1. install and/or start VS Code
2. Invoke View > Command Palette….
3. Type “install”, and select Extensions: Install Extensions.
4. Type “flutter” in the extensions search field, select Flutter in the list, and click Install. This also installs the required Dart plugin.
5. Invoke View > Command Palette….
6. Type “doctor”, and select the Flutter: Run Flutter Doctor.
7. Review the output in the OUTPUT pane for any issues. Make sure to select Flutter from the dropdown in the different Output Options.

Then, clone the repository using the git clone command if you do not have git installed it can be installed from here: https://git-scm.com/downloads. This can also be easily cloned using github desktop.

After the repository has been cloned navigate to the download destination directory in your terminal. You can use the terminal in VS Code.

Then, execute the following commands in your terminal:

flutter clean

flutter pub get

flutter run -> this can be substituted with "Run" in VS Code -> "Start Debugging"

If there are any issues, run "flutter doctor" again and follow instructions in error message provided.
If there's a problem with the dart SDK (this should already be included with Flutter SDK), use command: dart pub get 
Link for reference: https://dart.dev/get-dart
