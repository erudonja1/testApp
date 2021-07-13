//
//  HomeRouter.swift
//  BellabeatApp
//
//  Created by Elvis on 7/13/21.
//

import Foundation
import UIKit

class HomeRouter: NSObject {
    
    func createIntialWindow() -> UIWindow {
        let homeVc = HomeViewController()
        let homeViewModel = HomeViewModel(delegate: homeVc)
        homeVc.viewModel = homeViewModel
        let navigation = UINavigationController(rootViewController: homeVc)

        let frame = UIScreen.main.bounds
        let window = UIWindow(frame: frame)
        
        window.rootViewController = navigation
        window.makeKeyAndVisible()
        
        return window
    }
}
