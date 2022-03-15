# EITRepository
EIT Projects in here, dude!

1. Explain what is a protocol and why do we use them? 
Answer = A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol.

2. What is a REST-api?
Answer = An API, or application programming interface, is a set of rules that define how applications or devices can connect to and communicate with each other. A REST API is an API that conforms to the design principles of the REST, or representational state transfer architectural style. For this reason, REST APIs are sometimes referred to RESTful APIs.
First defined in 2000 by computer scientist Dr. Roy Fielding in his doctoral dissertation, REST provides a relatively high level of flexibility and freedom for developers. This flexibility is just one reason why REST APIs have emerged as a common method for connecting components and applications in a microservices architecture.

3. How do we get data from it?
Answer = REST APIs communicate via HTTP requests to perform standard database functions like creating, reading, updating, and deleting records (also known as CRUD) within a resource. For example, a REST API would use a GET request to retrieve a record, a POST request to create one, a PUT request to update a record, and a DELETE request to delete one. All HTTP methods can be used in API calls. A well-designed REST API is similar to a website running in a web browser with built-in HTTP functionality.
The state of a resource at any particular instant, or timestamp, is known as the resource representation. This information can be delivered to a client in virtually any format including JavaScript Object Notation (JSON), HTML, XLT, Python, PHP, or plain text. JSON is popular because it’s readable by both humans and machines—and it is programming language-agnostic.

4. What are the different ways we can handle multithreading in iOS?
Answer = 

5. What is Core Data?
Answer = Core Data is a framework that you use to manage the model layer objects in your application. It provides generalized and automated solutions to common tasks associated with object life cycle and object graph management, including persistence. 

6. What are other ways that you have used Data Persistency?
Answer = By default, all the variables and constants that you allocate in Swift are stored in memory, so they get lost when users quit the app. Different types of data can be saved to the device locally, using different tools (Swift APIs). To achieve that in Swift that we can use the following technologies (Swift APIs):

    UserDefaults
    Keychain
    Saving files to disk
    Core Data
    SQLite
    Property Lists

7. How do you make CoreData Thread Safe?
Answer = Core Data is designed to work in a multithreaded environment. However, not every object under the Core Data framework is thread safe. To use Core Data in a multithreaded environment, ensure that:

    Managed object contexts are bound to the thread (queue) that they are associated with upon initialization.

    Managed objects retrieved from a context are bound to the same queue that the context is bound to.
    
8. What are the different ways we can unwrap an optional?
  - Forced unwrapping — unsafe: 
            let a:String = x!

  - Implicitly unwrapped variable declaration — unsafe in many case: 
            var a = x!

  - Optional binding — safe.

            if let a = x {
              print("x was successfully unwrapped and is = \(a)")
            }

    - Optional chaining — safe.

            let a = x?.count

    - Nil coalescing operator — safe.

            let a = x ?? ""

    - Guard statement — safe.

            guard let a = x else {
              return
            }

    - Optional pattern — safe.

            if case let a? = x {
              print(a)
            }
            
9. How would you go about creating your own data structure to take the place of an optionals if they didn’t already exist in Swift?

10. What is a retain cycle? How do we avoid them?
Answer = A retain cycle occurs when two or more objects hold strong references to each other. As a result these objects retain each other in memory because their retain count would never decrement to 0, which would prevent deinit from ever being called and memory from being freed.

11. How are dispatch groups implemented?
Answer = You need to create a DispathGroup first, and the use group.enter() whenever you need something to be performed and after is finished you call group.leave() and the use notify() to notify the thread you want (.main or .global) that all the tasks have finished.

12. What is Autolayout?
Answer = Auto Layout constraints allow us to create views that dynamically adjust to different size classes and positions. The constraints will make sure that your views adjust to any size changes without having to manually update frames or positions.

13. What is a closure? What is the difference between an escaping and non-escaping closure?
Answer = Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to blocks in C and Objective-C and to lambdas in other programming languages.
- An escaping closure is a closure that’s called after the function it was passed to returns. In other words, it outlives the function it was passed to.
- A non-escaping closure is a closure that’s called within the function it was passed into, i.e. before it returns. This closure never passes the bounds of the function it was passed into.

14. What are lazy properties, how do they work?
Answer = Lazy initialization is often used when the initial value is relatively expensive to create. You only create the value when you are sure you need it.

15. What are property observers?
Answer = You can define property observers to monitor changes in a property’s value, which you can respond to with custom actions. Property observers can be added to stored properties you define yourself, and also to properties that a subclass inherits from its superclass.

16. What’s the application and controller lifecycle?
Anser = > Lifecycle events order

init(coder:)
(void)loadView
(void)viewDidLoad
(void)viewWillAppear
(void)viewDidAppear
(void)didReceiveMemoryWarning
(void)viewWillDisappear
(void)viewDidDisappear

How can we use them?

- init
i nit(coder:)

While creating the views of your app in a Storyboard, init(coder:) is the method that gets called to instantiate your view controller and bring it to life. During the initial phase of a view controller, you usually allocate the resources that the view controller will need during its lifetime. In this method, you might instantiate dependencies, including subviews that you’ll add to your view programmatically. And note that init(coder:) is called only once during the life of the object, as all init methods are.

- LoadView

(void)loadView 
It is only called when the view controller is created and only when done programatically. You can override this method in order to create your views manually. This is the method that creates the view for the view controller. If you are working with storyboards or nib files, then you do not have to anything with this method and you can ignore it. Its implementation in UIViewController loads the interface from the interface file and connects all the outlets and actions for you.

- viewDidLoad

-(void)viewDidLoad 
{
[super viewDidLoad];
}
It’s only called when the view is created. Keep in mind that in this lifecycle step the view bounds are not final. Good place to init and setup objects used in the viewController. When this method gets called, the view of the view controller has been created and you are sure that all the outlets are in place. It is also a good place where to start some background activity where you need to have the user interface in place at the end. A common case are network calls that you need to do only once when the screen is loaded. This method is called only once in the lifetime of a view controller, so you use it for things that need to happen only once.

- viewWillAppear

(void)viewWillAppear:(BOOL)animated 
You override this method for tasks that require you to repeat every time a view controller comes on screen. Keep in mind that this method can be called several times for the same instance of a view controller. This event is called every time the view appears and so, there is no need to add code here, which should be executed just one time. Usually you use this method to update the user interface with data that might have changed while the view controller was not on the screen. You can also prepare the interface for animations you want to trigger when the view controller appears.

- viewDidAppear

(void)viewDidAppear:(BOOL)animated
This method gets called after the view controller appears on screen. You can use it to start animations in the user interface, to start playing a video or a sound, or to start collecting data from the network. In some cases can be a good place to load data from core data and present it in the view or to start requesting data from a server.

- didReceiveMemoryWarning

(void)didReceiveMemoryWarning
iOS devices have a limited amount of memory and power. When the memory starts to fill up, iOS does not use its limited hard disk space to move data out of the memory like a computer does. If your app starts using too much memory, iOS will notify it. Since view controllers perform resource management, these notifications are delivered to them through this method. In this way you can take actions to free some memory. Keep in mind that if you ignore memory warnings and the memory used by your app goes over a certain threshold, iOS will end your app means this will look like a crash to the user and should be avoided.

- viewWillDisappear

(void)viewWillDisappear
Before the transition to the next view controller happens and the origin view controller gets removed from screen, this method gets called. You rarely need to override this method since there are few common tasks that need to be performed at this point, but you might need it.

- viewDidDisappear

(void)viewDidDisappear
After a view controller gets removed from the screen, this method gets called. You usually override this method to stop tasks that are should not run while a view controller is not on screen. For example, you can stop listening to notifications, observing other objects properties, monitoring the device sensors or a network call that is not needed anymore.

17. How would you store sensitive user data?
Answer = With Keychain

18. What is a Guard statement?
Answer = A guard statement is as simple as using an if..else statement and has its own benefits and uses. Swift guard is defined as a statement that is used to transfer program control out of a scope if one or more conditions aren’t met.
What it means is that it is essentially a redirection or early exit of a statement or function to prevent crashing and incorrect data. Guard is commonly used inside a function, closure or loop.

19. What is a Serial Queue?
Answer = Serial queues (also known as private dispatch queues) execute one task at a time in the order in which they are added to the queue. The currently executing task runs on a distinct thread (which can vary from task to task) that is managed by the dispatch queue.

20. What is the difference between strong, weak, & unowned? When do we use them?
Answer = The key difference between a strong and a weak or unowned reference is that a strong reference prevents the class instance it points to from being deallocated. 

21. How do we create Singletons in Swift?
Answer = The singleton pattern guarantees that only one instance of a class is instantiated.
A singleton is a class of which only one instance exists. A few examples:

    A company has only one CEO
    An API class has only one serial request queue
    An operating system has only one file system
    A solar system body revolves around one gravitational point
    An app that does I/O has only one default FileManager
    An airplane has only one flight deck

The second attribute of a singleton is that it has a global point of access. You can access a singleton, eg. call functions on it, from anywhere in your app’s code.

So, to summarize:

    A singleton is a class that has only one instance

    It can be accessed globally, i.e. anywhere in your code
    
This is the best way to create a singleton in Swift:

class API {
    static let shared = API()

    private init() {
    // Set up API instance
    }
}

And here’s how you use the singleton:

API.shared.doSomething()

