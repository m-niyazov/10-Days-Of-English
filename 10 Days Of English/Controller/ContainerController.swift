//
//  ContainerController.swift
//  EnglishApp
//
//  Created by Muhamed Niyazov on 24.11.2020.
//  Copyright © 2020 Muhamed Niyazov. All rights reserved.
//

import UIKit
class ContainerController: UIViewController {
    // MARK: - Properties
    var homeController: HomeController!
    
    // MARK: - Lifecyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    
    // MARK: - Helpers
    
    func  configureHomeController() {
        homeController = HomeController()
        let navController = UINavigationController(rootViewController: homeController)
        view.addSubview(navController.view)
        addChild(navController)
        print("Home Init")
        
    }
    
}




