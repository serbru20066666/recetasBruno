//
//  AppDelegate.swift
//  RecetasApp
//
//  Created by Bruno on 9/11/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    lazy var initializers: [Initializable] = [
        AlamofireInitializer(),
        ThemeInitializer()
    ]
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initializers.forEach { $0.performInitialization() }
        
        let initialController = RecetasNavigationController()
        initialController.setRootWireframe(ListaRecetasWireframe())
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window?.rootViewController = initialController
        self.window?.makeKeyAndVisible()
        return true
    }

}
