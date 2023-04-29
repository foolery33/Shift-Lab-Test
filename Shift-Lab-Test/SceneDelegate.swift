//
//  SceneDelegate.swift
//  Shift-Lab-Test
//
//  Created by admin on 22.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        var viewController: UIViewController
        if UserDefaults.standard.bool(forKey: "Authorized") {
            viewController = MainScreenViewController(
                viewModel: MainScreenViewModel(
                    contestsRepository: ContestsRepositoryImplementation()
                )
            )
        }
        else {
            viewController = RegisterScreenViewController(viewModel: RegisterScreenViewModel())
        }
    
        let navigation = UINavigationController(rootViewController: viewController)
        navigation.setNavigationBarHidden(true, animated: false)
        
        window.rootViewController = navigation
        self.window = window
        window.makeKeyAndVisible()
    }


}

