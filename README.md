### Two Is Better Than One

#### Author: Bart Jacobs

## Why Is Two Better Than One

While many applications can get away with a single managed object context, there will be times when one managed object context won't cut it. The setup I have come to appreciate looks like this.

![Two Is Better Than One](https://cocoacasts.s3.amazonaws.com/building-the-perfect-core-data-stack/two-is-better-than-one/two-is-better-than-one.jpeg)

The Core Data stack doesn't look overly complex. Right? Let me explain how it works and what the benefits are.

Even though the Core Data stack includes one persistent store coordinator and two managed object contexts, only one managed object context has a reference to the persistent store coordinator. This managed object context is private and only accessible by the class that manages the Core Data stack, the `CoreDataManager` class we created in the [previous lesson](https://cocoacasts.com/bring-your-own-core-data-stack/) of this course.

The second managed object context is a child of the private managed object context or, put differently, the private managed object context is the parent managed object context of the second managed object context. The child managed object context doesn't know about the persistent store coordinator.

Why is this necessary? What are the benefits of using two managed object contexts? The private managed object context operates on a background queue. This means that it does not block the main thread, the thread on which the user interface is updated, when it performs operations.

The second managed object context, which is a child of the private managed object context, operates on the main thread, which makes it ideal for any operations that involve the user interface. I talk more about threading and concurrency later in this course.

Using parent and child managed object contexts is also known as **nesting** managed object contexts. When using nested managed object contexts, there are a number of consequences you need to be aware of.

**Read this article on [Cocoacasts](https://cocoacasts.com/two-is-better-than-one/)**.
