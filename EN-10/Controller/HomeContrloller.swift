//
//  HomeContrloller.swift
//  EnglishApp
//
//  Created by Muhamed Niyazov on 24.11.2020.
//  Copyright © 2020 Muhamed Niyazov. All rights reserved.
//

import UIKit
import SnapKit

class HomeController: UIViewController {
    // MARK: - Properties
    var viewModel: HomeControllerVMType?
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        fetchDays()
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard  let viewModel = viewModel else { return }
        updateLeftBarLabel(text: "День \(viewModel.whichDay)")
        configureDayView()
    }
    
    func fetchDays() {
        DaysService.shared.fetchDays { (days) in
            self.viewModel = HomeControllerViewModel(days: days)
            self.configureNavigationBar()
            self.configureDayView()
        }
    }
    
    
    // MARK: - Selectors
    
    @objc func handleMenuToggle(){
        let menuController = MenuController()
        menuController.viewModel = viewModel?.generateMenuControllerViewModel()
        navigationController?.pushViewController(menuController, animated: true)
    }
    
    // MARK: - Helpers
    func configureDayView(){
        guard let viewModel = viewModel else { return }
        let dayView = DayMainView(frame: .zero, viewModel: viewModel.generateDayViewModel())
        dayView.delegate = self
        
        if(view.subviews.count >= 1){
            for view in view.subviews {
                view.removeFromSuperview()
            }
            view.addSubview(dayView)
        } else {
            view.addSubview(dayView)
        }
        
        dayView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-16)
        }
        
        let iphoneXAndLater =  view.safeAreaInsets.bottom
        if(iphoneXAndLater > 0) {
            dayView.snp.makeConstraints { (make) in
                make.bottom.equalTo(view).offset(-34 + 15)
            }
        }
        else {
            dayView.snp.makeConstraints { (make) in
                make.bottom.equalTo(view)
            }
        }
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let leftBarLabel: UILabel = {
            let label = UILabel()
            label.textColor = .white
            label.bounds = CGRect(x: 0, y: 0, width: 80, height: 30)
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 10
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.text = "День \(viewModel!.whichDay)"
            label.backgroundColor = .mainPink
            return label
            
        }()
        
        let rightBarImage: UIImage = {
            var image = UIImage()
            let boldFont = UIFont.boldSystemFont(ofSize: 20)
            let configuration = UIImage.SymbolConfiguration(font: boldFont)
            image = UIImage(systemName: "list.bullet", withConfiguration: configuration)!
            let blackColorImage = image.withTintColor(.black, renderingMode: .alwaysOriginal)
            image = blackColorImage
            return image
        }()
        
        
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        backItem.tintColor = .mainPink
        navigationItem.backBarButtonItem = backItem
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBarLabel)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightBarImage, style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    func updateLeftBarLabel(text: String){
        let label = navigationItem.leftBarButtonItem!.customView as! UILabel
        label.text = text
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: label)
        
    }
    
}

extension HomeController: DayMainViewDelegate {
    func handleNextDayBtn(activeDay: Int) {
        guard let viewModel = viewModel else { return }
        func configureView(_ activeDay: Int) {
            self.viewModel = HomeControllerViewModel(days: viewModel.days, withSelectedDay: activeDay)
            configureDayView()
            configureNavigationBar()
        }

        if(activeDay == 10) {
            configureView(0)
        } else {
            configureView(activeDay)
        }
        
    }
}
