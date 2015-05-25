//
//  AppDelegate.swift
//  AddressBook
//
//  Created by taisuke fujita on 2014/08/10.
//  Copyright (c) 2014年 taisuke fujita. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?

    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let splitViewController = self.window!.rootViewController as! UISplitViewController
        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
        navigationController.topViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem()
        splitViewController.delegate = self
        
        let masterNavigationController = splitViewController.viewControllers[0] as! UINavigationController
        let controller = masterNavigationController.topViewController as! MasterViewController
        controller.managedObjectContext = self.managedObjectContext
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    // MARK: - Split view
    
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController:UIViewController!, ontoPrimaryViewController primaryViewController:UIViewController!) -> Bool {
        if let secondaryAsNavController = secondaryViewController as? UINavigationController {
            if let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController {
                if topAsDetailController.detailItem == nil {
                    // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
                    return true
                }
            }
        }
        return false
    }
    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.9revolution9.AddressBook" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1] as! NSURL
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("AddressBook", withExtension: "momd")
        return NSManagedObjectModel(contentsOfURL: modelURL!)!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        var coordinator: NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        weak var psc = coordinator
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("AddressBook.sqlite")
        // サブスレッドで実行(メインスレッドで実行するとiCloudのデータ同期でエラーが発生する)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            var options: [String: AnyObject] = [NSPersistentStoreUbiquitousContentNameKey: "AddressBook"]
            var error: NSError? = nil
            var failureReason = "There was an error creating or loading the application's saved data."
            if coordinator!.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: options, error: &error) == nil {
                coordinator = nil
                // Report any error we got.
                var dict = [String: AnyObject]()
                dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
                dict[NSLocalizedFailureReasonErrorKey] = failureReason
                dict[NSUnderlyingErrorKey] = error
                error = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
                // Replace this with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                NSLog("Unresolved error \(error), \(error!.userInfo)")
                abort()
            }
        }
        
        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext? = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        if coordinator == nil {
            return nil
        }
        
        var moc = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        moc.persistentStoreCoordinator = coordinator
        // 通知の設定
        let center = NSNotificationCenter.defaultCenter()
        center.addObserver(self,
            selector: "storesWillChange:",
            name: NSPersistentStoreCoordinatorStoresWillChangeNotification,
            object: coordinator)
        center.addObserver(self,
            selector: "storesDidChange:",
            name: NSPersistentStoreCoordinatorStoresDidChangeNotification,
            object: coordinator)
        center.addObserver(self,
            selector: "persistentStoreDidImportUbiquitousContentChanges:",
            name: NSPersistentStoreDidImportUbiquitousContentChangesNotification,
            object: coordinator)
        return moc
    }()

    func storesWillChange(notification: NSNotification!) {
        NSLog("storesWillChange:\(NSThread.isMainThread())")
        weak var moc = self.managedObjectContext
        moc!.performBlock {
            if moc!.hasChanges {
                var error: NSError? = nil
                if !moc!.save(&error) {
                    NSLog("Unresolved error \(error), \(error!.userInfo)")
                    abort()
                }
            }
            moc!.reset()
        }
    }
    
    func storesDidChange(notification: NSNotification!) {
        NSLog("storesDidChange:\(NSThread.isMainThread())")
        // メインスレッドで実行
        let queue = NSOperationQueue.mainQueue()
        queue.addOperationWithBlock({
            // UIの更新用の通知
            let center = NSNotificationCenter.defaultCenter()
            center.postNotificationName("RefetchAllDatabaseData", object: self)
        })
    }
    
    func persistentStoreDidImportUbiquitousContentChanges(notification: NSNotification!) {
        NSLog("persistentStoreDidImportUbiquitousContentChanges:\(NSThread.isMainThread())")
        weak var moc = self.managedObjectContext
        moc!.performBlock {
            moc!.mergeChangesFromContextDidSaveNotification(notification)
        }
    }

    // MARK: - Core Data Saving support

    func saveContext() {
        if let moc = self.managedObjectContext {
            var error: NSError? = nil
            if moc.hasChanges && !moc.save(&error) {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                NSLog("Unresolved error \(error), \(error!.userInfo)")
                abort()
            }
        }
    }

}

