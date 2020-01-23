# taskForMsApps

Answers for interview questions:
1.Describe what is IOS?

- iOS is an operating system apple have been developed for all of their mobile devices like iPhone iPad iPod AppleTV, it’s a system that installed in the device to be able to control the device.

2. what is Cocoa Touch class?

- Cocoa Touch class is a template class given to us by apple with useful code that depends on the class we inherit from. The code may be different for any super class. Unlike a regular swift file for example that just gives us an empty blank.

3. Describe app lifecycle?

- applications have different. By these states we can control the app to do anything we need at any state. Some operations created by the user and some by the operating system. The operating system uses app in background to make some different tasks we might need it to do for us. And the user interaction made by our choice:
App scene delegate is in control:

when the app is not lunched it is not active and not running at all. when we tap the application to lunch it runs the willFinishLaunchingWithOptions method right after the connetionOptions method and making the app to to foreground but the app cant to process events.

after lunching executes sceneWillEnterForeground method and the app is loading, after that viewDidLoad method running to make some configurations for the first viewController and than the sceneDidBecomeActive method axecutes, now the app is active, right after activation viewDidApear method runs.

when we go to the main screen of the device from our app the sceneWillResignActive start to run to resign is place on the display and to go background and after it gets to background executes sceneDidEnterBackground method that says it now working in background and the app can process event from background (things that now related to user interface). when get back to out app executes sceneWillEnterForeground method and preparing the app to forground again after it becomes active sceneDidBecomeActive method executes.

if we want to suspend out app it will execute sceneWillResignActive after disconnecting the app runs sceneDidDisconnect method and than didDiscardSceneSession executes and remove the app from processing memory.

4. Give example scenarios when an application goes into InActive state.

the user get phone call while using the app, the app in active state moves to background state by resigning is self and becomming in background. as explained in answer 3.

5. What is an AdHoc certificate?

an Adhoc used for testing the app before distributing or developing for a specific purpose, list a helper app for group of people.

6. What is a Singleton class? Where would you use it in the application and how?

A singleton is a design pattern we can make to have only 1 initialization. Its format is usually written with shared variable that contains the only inctance of the current class, also inside the singleton we make the init func private so there will not be option of creating more instances. Also we can make vriables in the singleton and store there our required data and access to the data from all the application.

Example for using a singletone, is if we have logged in user and we want to get to all of his data, or setting or other information stored in It, we can save the user in the singleton and use the users information all over the application.

7. What's the difference between synchronous and asynchronous calls in Objective-C?

in synchronous we run in the main thread so every task is working in order, if task 1 started task 2 will not work, only when task 1 is done task 2 will start, and after it will done task 3 will start and so on.

Asynchronous calls are different, it executes the tasks one after another and don’t wait till the started task will done. it start the next task right away. it is starting an other thread and make the task on this thread (like background thread), it is simultaneously work with the main thread. for example the main thread starts on background thread task 1, and it starts to work. while task 1 is working in other thread the main thread can continue to start and other tasks. by this we can make the user interface free to use while some operation is working. 
an example for that can be an HPPTS request that takes time, by starting it on different thread we still able to do thing in the interface. also by starting multiple tasks they can end in different time according to the time the task take.

8. What is a dispatch

dispatch helps us to manage out threads work with that we can choose what will run on the main thread and what on other threads. also there are QOS - quality of service the defines the importance of the task on a thread like : .background, .utility, .default, .userInitiated, .userInteractive, .main. the threads run simultaneously.

9. What is delegates/Protocol? give example of use it

Delegates are protocols that are used to communicate between viewControllers, this is a design pattern the helps us with communication. In order make some modification in one view by selecting an option from the other view we can use delegate pattern. Also we can modify components as we need them like collection view or table view or picker view and so on… by applying the delegate protocol of each.

For example, if we have a table view and we want it to show some data that we provide, we need to apply the UITableViewDelegate, and thanks to this delegate protocol we can create and manage the header and footer views, make custom height for a row, indent row content, response to row selection and more…

In short with delegate design pattern we can send data from one view to another, also with UIComponents, we can modify them as we want to show the data we want.

10. Have you uploaded an app to the app store?

No I have not uploaded an app to the app store yet, but of course I will in the future.

