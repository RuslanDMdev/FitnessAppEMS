//
//  SceneDelegate.swift
//  TestFitness
//
//  Created by Ruslan Dalgatov on 13.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // 1. Захват сцены
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        // 3. Программно создаем основной контроллер и интегрируем в него NavigationController
        let viewController = AuthViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        // 4. Определяем navigationController as rootViewController
        window.rootViewController = navigationController
        // 5. Настройка window
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        self.window = window
        window.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

