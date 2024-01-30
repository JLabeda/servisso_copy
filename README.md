## Q1 2024 recruitment demo project

This is a copy of Servisso project's repository, which I'm working on with my backend dev friend. <br>
<strong>100% of Flutter code & configuration was written by me.</strong> <br>
Please be aware that this is a 'after hours' project, therefore there always had to be made a decision on what is the most urgent thing to do next :smiley: 
Nevertheless I decided to share this repo as it is the most reliable source of my current skills, which I'm entitled to share.
<br>
#### A little bit of context:
App idea is to provide Mobile App (Vehicle owner) to Web Portal (Vehicle service) seamless communication. This app will be dedicated for vehicle owners to manage their machines with strong emphasis on maintanance of them (with all conveniences). On the other hand Web portal (second Flutter app) will be more dedicated to managing car service from the point of bussiness owner.
<br>
#### Prepared application core:
* Firebase Auth is implemented.
* Firebase serves also as a database. Our backend is a middleware in data processing between Flutter app and Firebase Cloud Firestore.
* In this project I use BLoC for state management.
* For navigation GoRouter with named routes is used.
* AppLocalizations with .arb files for polish, english & ukrainian translations (however no way of changing locale from within the app as of now :smiley:).
* First feature is on the way - user can add vehicle to his account and remove them

#### Also to be noted:
* I'm aware of not sufficient validation of forms - will be done when the time comes.
* I'm aware of not the best app styling (apart from VehicleTile, also not terrible :smiley:) - Before working on that with more dedication I'm waiting for my sister, who works as a UI designer to ship Figma designs for me.
* I'm sharing this mostly with regard to the codebase itselt, but if you wish to run the app it is also possible. It uses Flutter 3.16.0.
* Finally - if you run the app, please be aware that there may be a bug or two as it's not well tested yet.
  
