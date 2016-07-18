//
//  AppDelegate.swift
//  CoreDataStack
//
//  Created by Bart Jacobs on 17/07/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let coreDataManager = CoreDataManager(modelName: "DataModel")

    // MARK: - Application Life Cycle

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        print(coreDataManager.mainManagedObjectContext)
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        coreDataManager.saveChanges()
    }

    func applicationWillTerminate(application: UIApplication) {
        coreDataManager.saveChanges()
    }

}
