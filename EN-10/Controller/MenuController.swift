//
//  MenuController.swift
//  EnglishApp
//
//  Created by Muhamed Niyazov on 24.11.2020.
//  Copyright © 2020 Muhamed Niyazov. All rights reserved.
//

import UIKit
class MenuController: UIViewController {
    // MARK: - Properties
    var viewModel: MenuControllerVMType? {
        didSet {
            configureTableView()
        }
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
    }
    
    // MARK: - Helpers
    
    func configureTableView(){
        let  tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: "MenuOptionCell")
        tableView.rowHeight = 65
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func  configureNavigationBar(){
        let centerTitleLabel: UILabel = {
            let label = UILabel()
            label.textColor = .mainBlue
            
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.text = "Расписание"
            
            return label
            
        }()
        navigationItem.titleView  = centerTitleLabel
        
    }
    
}

extension MenuController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return  0}
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        viewModel.selectRow(atIndexPath: indexPath)
        let dayViewModel = viewModel.viewModelForSelectedRow()
        let homeController = navigationController?.viewControllers[0] as? HomeController
        homeController?.viewModel = dayViewModel
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuOptionCell", for: indexPath) as! MenuOptionCell
        guard let viewModel = viewModel else { return UITableViewCell() }
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        cell.viewModel = cellViewModel
        return cell
    }
}


