//
//  SceneDelegate.swift
//  ExampleApp
//
//  Created by Black Bacterium on 04.10.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let helper = Helper()
        let viewController = ViewController()
        viewController.helper = helper
        
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        
        self.window = window
    }
}
