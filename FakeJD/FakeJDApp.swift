//
//  FakeJDApp.swift
//  FakeJD
//
//  Created by 高炼 on 2023/3/13.
//

import SwiftUI

@main
struct FakeJDApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        swizzing()
        
        return true
    }
    
    func swizzing() {
        let original = class_getInstanceMethod(UITabBarController.self, #selector(UITabBarController.viewWillAppear(_:)))
        let replace = class_getInstanceMethod(UITabBarController.self, #selector(UITabBarController._viewWillAppear(_:)))
        
        if let original = original, let replace = replace {
            method_exchangeImplementations(original, replace)
        }
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let configuration = UISceneConfiguration(
            name: nil,
            sessionRole: connectingSceneSession.role
        )
        
        if connectingSceneSession.role == .windowApplication {
            configuration.delegateClass = SceneDelegate.self
        }
        
        return configuration
    }
}

class SceneDelegate: NSObject, UIWindowSceneDelegate, ObservableObject {
}

extension UITabBarController {
    @objc fileprivate func _viewWillAppear(_ animated: Bool) {
        _viewWillAppear(animated)
        tabBar.isHidden = true
    }
}
