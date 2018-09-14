//
//  AppDelegate.swift
//  Todo
//
//  Created by Marquez on 14/09/2018.
//  Copyright © 2018 Marquez. All rights reserved.
//

import RIBs
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var launchRouter: LaunchRouting?
    private var urlHandler: URLHandler?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let result = RootBuilder(dependency: AppComponent()).build()
        let launchRouter = result.launchRouter
        urlHandler = result.urlHandler
        self.launchRouter = launchRouter
        launchRouter.launchFromWindow(window)
        
        return true
    }
    
    open func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        urlHandler?.handle(url)
        return true
    }
}

protocol URLHandler: class {
    func handle(_ url: URL)
}
