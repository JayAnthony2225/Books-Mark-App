//
//  SceneDelegate.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 1/21/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
            //window = UIWindow(frame: UIScreen.main.bounds)
           // window?.windowScene = scene
        
        if UserDefaults.standard.string(forKey: "User") != nil{
        let tabBarViewController = UITabBarController()  // Codigo para TAB BAR
        let StartViewController = tabBarViewController
        let libreriaOption = LibreriaViewController()
        let searchOption = SearchViewController()
        let profileOption = ProfileViewController()
             libreriaOption.title = "Home"
             searchOption.title = "Search"
             profileOption.title = "User"
         tabBarViewController.setViewControllers([libreriaOption, searchOption, profileOption], animated: true)
             guard let items = tabBarViewController.tabBar.items else {
                 return
             }
             let images = ["house", "magnifyingglass", "person.circle"]
             for x in 0..<items.count {
                 items[2].badgeValue = "3"
                 items[x].image = UIImage(systemName: images[x])
             }
            window?.rootViewController = StartViewController
            window?.makeKeyAndVisible()
        } else {
            
            let firstViewController = PageViewController()
            window?.rootViewController = firstViewController
            window?.makeKeyAndVisible()
            
        }
        
       
             
    
        
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

