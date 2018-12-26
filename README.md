# Xfinity
The document is to understand the exercise application by Comcast

# How to run the project
*Assumption – The machine on which project is run has Carthage installed as dependency manager tool (The project will not compile without it.)*

*Link to install - https://github.com/Carthage/Carthage/releases/download/0.31.2/Carthage.pkg*

1.	Open the Xfinity.xcworkspace file.
2.	Build the BaseApp scheme to generate the BaseApp.framework file.
3.	Change scheme to The Wire Character Viewer or Simpsons Character Viewer.
4.	Run the app.

# Implementation Approach
-	As the two-app version which were going to use the shared code, the best option was to put the code in the external framework and use the framework by calling the initializers from respective apps. So, created “BaseApp” as CocoaTouchFramework to implement common functionality between the two apps.
-	Used Carthage as dependency manager to integrate external dependencies in the project.
-	Used UISplitViewController to have UI functionality for iPad and iPhone.

# Architecture Used
-	Used MVVM architecture to have layered architecture between view, view model and model classes to have separation between UI and Logical functionality.

# Patterns Used
-	Used factory pattern to initialize factory for two apps having same functionality

# External Library Used
-	SDWebImage – Used for downloading and image caching for characters.

# Modules in Application
-	BaseApp Framework – Cocoa touch framework which contains common code to be used in both apps.
-	The Wire Character Viewer – Application to be designed.
-	Simpsons Character Viewer – Application to be designed.

# Extra Functionality
-	Implemented search character functionality.  
Base App
-	Helper – Has files/class for functionality throughout the application.
-	Main Application – To implement the functional required in the exercise.
-	Model Class – To have the model classes for the service call.

# Helper
-	Application Manager – Purpose of this class is to initialize the app with the correct app type and give the initial controller to the child apps.
-	Constants – To store the constants such as default strings/name of controller/storyboards to be used throughout the app.
-	Character Request Manager – To make the service call with the appropriate URL and return the content. The method in the call can receive any url and return content.
-	Bundle Helper – To determine the bundle of the base app framework.
-	UIViewController+Alert – Generic utility file to show any kind of alert. (Used in app for service failure)
-	String+SplitHelper – Generic utility for parsing content of the service and splitting using hyphen for title and detail text.

# Main Application
-	CharacterList – Contains all the views/storyboards, view controller, view models to be used to show character list.
-	CharaterDetail – Contains all the views/storyboards, view controller, view models to be used to show character detail screen.
-	AppTypeFactory – As functionality for both the apps was same the best pattern could be used was factory
The group contains a base factory class names CharacterFactory.
Also has two sub-factories SimpsonFactory and WireCharacterFactory which inherit the properties of CharacterFactory.

CharacterFactory – Initializes the property such as url, app type and has method to make service call and get data.

Model Classes – Has class such as CharacterModel, RelatedTopics, Icon to store the content of the service.

Also wrote Unit Test for the view models for controllers in target BaseAppTests
