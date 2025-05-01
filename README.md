# SETUP INSTRUCTION
1) Clone/download the repository
2) Open in android studio
3) Get all the dependencies using 'flutter pub get'
4) Connect a virtual machine of your choice and run the project. 
5) For best results, pair your phone using Wifi

# SUPABASE SETUP INSTRUCTION
1) Create an account either manually or using Github
2) Go to your dashboard and scroll down to find the API section
3) Click on 'View API settings' to get your project url and anon key
4) Add the tables either manually using 'Table Editor' or run the sql script using 'SQL Editor'
5) Use the project url and anon key obtained above by putting them in the placeholder in main.dart file

# HOT RELOAD VS HOT RESTART
1) Hot Reload
    - updates the changes in the running app
    - preserves the app state
    - used commonly in case of UI changes (colours, layouts, etc)
    - also used for updating methods, classes and functions which don't impact state initialization

2) Hot Restart
    - rebuilds the widget completely again
    - clears the state 
    - rebuilds the app
    - used when updating initialization logic, global variables , etc
    - best method re-check the updates
