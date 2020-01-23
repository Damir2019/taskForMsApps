# taskForMsApps

Answers for interview questions:
1.Describe what is IOS?

- iOS is an operating system apple have been developed for all of their mobile devices like iPhone iPad iPod AppleTV, it’s a system that that installed in the device to be able to control the device.

2. what is Cocoa Touch class?

- Cocoa Touch class is a template class given to us by apple with useful code the depends on the class we inherit from. The code may be different for any super class. Unlike a regular swift file for example that just gives us an empty blank.

3. Describe app lifecycle?

- application have different states they are in any moment. By these states we can control the app to do anything we need at any state. Some operations created by the user and some by the operating system. The operating system uses app in background to make some different tasks we might need to own benefit. And the user interaction made by our choice:
App scene delegate controls the app states and executed function to move the app to different states:

When user tap the app icon first goes the willFinishLaunchingWithOptions method that initialize the app after that the connetionOptions method run configure and attach the right scene to the ui.
After that executes sceneWillEnterForeground method that loads the app and viewDidLoad executes and making the view to first initializations after that the sceneDidBecomeActive method runs says that the view is ready and that the viewDidAppear executes after the view is shown.

And now the app is in the foreground.
If the make the app run in background from now it will run the sceneWillResignActive method to make the app to resign it place in the screen and get ready to work in background and then enters to background, the sceneDidEnterBackground method called says that the app now runs in the background.

If we will get inside again from background it will executes the sceneWillEnterForeground method and get the app from background to the foreground and after it gets run the sceneDidBecomeActive method.

Completely close the app from foreground will start by executing the sceneWillResignActive, and this time will discard the app executing sceneDidDisconnect and then didDiscardSceneSession runs and the app is closed and not in the memory anymore. Tapping on the app's icon will run the app from the beginning.
4. Give example scenarios when an application goes into InActive state.

A good example for application goes inactive is when is move to work in background:
When the app state is sceneDidBecomeActive, moving to the home screen will execute the sceneWillResignActive method leads to the sceneWillEnterBackground method and the app is now working in background.

5. What is an AdHoc certificate?

Is a way of testing your app on predetermined devices.

6. What is a Singleton class? Where would you use it in the application and how?

A singleton is a class that can have only 1 reference to it. Its format is usually written with shared variable that contains the only reference of the current singleton, also inside the singleton we make the init func private so there will now be option of creating more references. Also we can make vriables in the singleton and store there our required data and access to the data from all the application.

Example for using a singletone, is if we have logged in user and we want to get to all of his data, or setting or other information stored in It, we can save the user in the singleton and user the users information all over the application.

7. What's the difference between synchronous and asynchronous calls in Objective-C?

The different between synchronous and asynchronous call is the way that task are start.
In synchronous calls everything has serial order of execution which mean that if we have 4 tasks, the first one will to start will be task 1 only after it is completely finished task 2 will start and again only after it finishes task 3 will start and so on after that task 4. Mean every task have is order to execute.

Asynchronous calls are different, it executes the tasks one after another but don’t wait will the previous one that just started will finish first to start the next one. No is run all the task one right after another, for example if we have 4 the same 4 task like before asynchronous call will call at first the first task right after that while task 1 is running it will call task 2 and as tasks 1 and 2 running (depends on how much tine the run, one of them may finish before that) it will start task 3 and as the same with task 4, and all the tasks run together at the same time and they will finish when they finish, nobody is waiting for them to finish and they still provide they result. One thing to notice is that we cant know who will finish first or the order they will finish.

8. What is a dispatch


9. What is delegates/Protocol? give example of use it

Delegates are protocols that are used to communicate between viewControllers, this is a communication pattern. In order make some modification in one view by selecting an option from the other view we can use delegate pattern. Also we can modify components as we need them like collection view or table view or picker view and so on… by applying the delegate protocol of each.

For example, if we have a table view and we want it to show some data that we provide, we need to apply the UITableViewDelegate, and thanks to this delegate protocol we can create and manage the header and footer views, make custom height for a row, indent row content, response to row selection and more…

In short with delegate design pattern we can send data from one view to another, also with UIComponents, we can modify them as we want to show the data we want.


10. Have you uploaded an app to the app store?

No I have not uploaded an app to the app store yet, but of course I will in the future .

