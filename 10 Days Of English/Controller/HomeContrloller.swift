//
//  HomeContrloller.swift
//  EnglishApp
//
//  Created by Muhamed Niyazov on 24.11.2020.
//  Copyright © 2020 Muhamed Niyazov. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    // MARK: - Properties
    var day: Day?
    
    
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        whichDayControllerShow()
        configureNavigationBar()
        
    }
    
    
    
    // MARK: - Handlers
    
    @objc func handleMenuToggle(){
        let menuController = MenuController(activeDay: day)
        menuController.delegate = self
        navigationController?.pushViewController(menuController, animated: true)
    }
    
    func updateLeftBarLabel(text: String){
        let label = navigationItem.leftBarButtonItem!.customView as! UILabel
        label.text = text
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: label)
        
    }
    
    func configureNavigationBar(){
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.barStyle = .black
        
        var image: UIImage?
        
        if #available(iOS 13.0, *) {
            let boldFont = UIFont.boldSystemFont(ofSize: 20)
            let configuration = UIImage.SymbolConfiguration(font: boldFont)
            image = UIImage(systemName: "list.bullet", withConfiguration: configuration)
            let blackColorImage = image?.withTintColor(.black, renderingMode: .alwaysOriginal)
            image = blackColorImage
        } else {
            image = UIImage(named: "menu-icon")
        }
        
        let leftBarLabel: UILabel = {
            let label = UILabel()
            label.textColor = .white
            label.bounds = CGRect(x: 0, y: 0, width: 80, height: 30)
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 10
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.text = "День \(day!.whichDay)"
            label.backgroundColor = pink
            return label
            
        }()
        
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        backItem.tintColor = pink
        navigationItem.backBarButtonItem = backItem
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBarLabel)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleMenuToggle))
        
    }
    
    
    func whichDayControllerShow() {
        if(day == nil) {
            self.day = DataManager.instance.daysList[0]
            let day1 = Day1(day: day)
            self.addChildElement(day1)
        } else {
            let day1 = Day1(day: day)
            let day2 = Day2(day: day)
            
            deleteChildElement()
            
            switch day!.whichDay {
            case 1:
                self.addChildElement(day1)
            case 2:
                self.addChildElement(day2)
            default:
                print("\(day?.whichDay ?? 0) default switch")
            }
        }
        
    }
    
}


extension HomeController: MenuControllerDelegate {
    func selectedDay(day: Day) {
        if(self.day?.title == day.title) {
            updateLeftBarLabel(text: "День \(day.whichDay)")
        } else {
            self.day = day
            updateLeftBarLabel(text: "День \(day.whichDay)")
            whichDayControllerShow()
        }
        
    }
    
}

extension HomeController {
    func addChildElement(_ child: UIViewController){
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
        print("add \(child)")
    }
    
    func deleteChildElement(){
        if self.children.count > 0 {
            let viewControllers:[UIViewController] = self.children
            for viewContoller in viewControllers{
                viewContoller.willMove(toParent: nil)
                viewContoller.view.removeFromSuperview()
                viewContoller.removeFromParent()
                print("delete  \(viewContoller)")
            }
            
        }
    }
}

