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
    var tableView: UITableView!
    var delegate: MenuControllerDelegate?
    var activeDay: Day?
    
    
    // MARK: - Init
    
    
    convenience init() {
        self.init(activeDay: nil)
    }
    
    init(activeDay: Day?) {
        self.activeDay = activeDay
        super.init(nibName: nil, bundle: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureNavigationBar()
        view.backgroundColor = .black
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
    func configureTableView(){
        tableView = UITableView()
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
            label.textColor = mainBlue
            
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
        DataManager.instance.daysList.count
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let day = DataManager.instance.daysList[indexPath.row]
        delegate?.selectedDay(day: day)
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuOptionCell", for: indexPath) as! MenuOptionCell
        let menuOption = DataManager.instance.daysList[indexPath.row]
        cell.titleLabel.text = menuOption.title
        cell.subtitile.text = "День \(menuOption.whichDay)"
        cell.subtitile.textColor = .lightGray
        cell.titleLabel.textColor = .lightGray
        if (activeDay?.title == cell.titleLabel.text){
            cell.subtitile.textColor = mainBlue
            cell.titleLabel.textColor = .black
        }
        
        
        return cell
    }
    
    
    
}

