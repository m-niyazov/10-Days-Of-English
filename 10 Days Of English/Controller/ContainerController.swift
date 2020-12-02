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
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    
    // MARK: - Handlers
    
    func  configureHomeController() {
        homeController = HomeController()
        let navContrcller = UINavigationController(rootViewController: homeController)
        view.addSubview(navContrcller.view)
        addChild(navContrcller)
        print("Home Init")
        
    }
    
}





