### Keeping It Private

#### Author: Bart Jacobs

In the previous lesson, we updated the Core Data stack by adding a private managed object context. Remember that the private managed object context performs two tasks:

- it pushes its changes to the persistent store coordinator
- it acts as the parent of the main managed object context

This is what the Core Data stack currently looks like.

![A Core Data Stack With Two Managed Object Contexts](https://cocoacasts.s3.amazonaws.com/building-the-perfect-core-data-stack/keeping-it-private/keeping-it-private-1.jpg)

It is important to understand that the private managed object context should only be access by the `CoreDataManager` class. Other objects, such as view controllers, use the main managed object context to interact with the Core Data stack.

But this can result in threading and performance issues if the main managed object context is used by objects that should not be using it. For example, what happens if an object performs a long-running operation using the main managed object context to fetch data from the persistent store? What happens if the application downloads data in the background and inserts it into the persistent store?

In such scenarios, it is better to create a separate managed object context that operates on a background thread. The Core Data stack we are after looks something like this.

![A Core Data Stack With Multiple Managed Object Contexts](https://cocoacasts.s3.amazonaws.com/building-the-perfect-core-data-stack/keeping-it-private/keeping-it-private-2.jpg)

**Read this article on [Cocoacasts](https://cocoacasts.com/keeping-it-private/)**.
