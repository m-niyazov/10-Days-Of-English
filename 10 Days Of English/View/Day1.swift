//
//  Day1.swift
//  EnglishApp
//
//  Created by Muhamed Niyazov on 25.11.2020.
//  Copyright © 2020 Muhamed Niyazov. All rights reserved.
//

import UIKit

class Day1: UIViewController {
    //MARK: - Properties
    var day: Day!
    lazy  var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
    //MARK: - Views
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = .white
        view.frame = self.view.bounds
        view.contentSize = contentViewSize
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.frame.size = contentViewSize
        return view
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "\(day.title)"
        return label
    }()
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        containerView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false

//      label.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 30).isActive = true
        label.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
    
    init(day: Day?) {
        self.day = day
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Handlers
}
