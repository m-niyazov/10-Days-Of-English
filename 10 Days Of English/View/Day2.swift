//
//  Day2.swift
//  EnglishApp
//
//  Created by Muhamed Niyazov on 25.11.2020.
//  Copyright © 2020 Muhamed Niyazov. All rights reserved.
//

import UIKit
class Day2: UIViewController {
    var day: Day!
    
    init(day: Day?) {
        self.day = day
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height:
            view.frame.height))
        scrollView.backgroundColor = .yellow
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 2100)
        let label: UILabel = {
            let label = UILabel()
            label.text = "Someone text1111"
            return label
        }()
        
        scrollView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 0).isActive = true
        label.leftAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leftAnchor, constant: 30).isActive = true
        label.rightAnchor.constraint(equalTo: scrollView.contentLayoutGuide.rightAnchor).isActive = true
        
    
//        scrollView.addSubview(label2)
//
//        label2.translatesAutoresizingMaskIntoConstraints = false
//
//        label2.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor, constant: 2000).isActive = true
//        label2.leftAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leftAnchor, constant: 30).isActive = true
//        label2.rightAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.rightAnchor).isActive = true
//
//
    }
    
    
}

