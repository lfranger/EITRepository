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
Anser = 


