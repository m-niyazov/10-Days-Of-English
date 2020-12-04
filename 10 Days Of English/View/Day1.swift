//
//  Day1.swift
//  EnglishApp
//
//  Created by Muhamed Niyazov on 25.11.2020.
//  Copyright © 2020 Muhamed Niyazov. All rights reserved.
//

import UIKit
import SnapKit

class Day1: UIViewController {
    //MARK: - Properties
    var day: Day!
    
    //MARK: - Views
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var mainTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "\(day.title)"
        label.font = UIFont (name: "HelveticaNeue-Light", size: 22)
        return label
    }()
    
    lazy var howDoLabel: UILabel = {
        let label = UILabel()
        label.text = "Как это делать?"
        label.font = UIFont (name: "HelveticaNeue", size: 16)
        label.layer.borderColor = lightBlue.cgColor
        label.layer.borderWidth = 3
        label.layer.cornerRadius = 5
        label.textAlignment = .center
        return label
    }()
    
    lazy var stackViewListContainer: UIView = {
        let view = UIView()
        view.backgroundColor = lightBlue
        view.layer.cornerRadius = 10
        return view
    }()
    
    
    lazy var stackViewList: UIStackView = {
        let stackViewList = UIStackView()
        stackViewList.axis = .vertical
        // stackViewList.addBackground(color: lightBlue)
        stackViewList.alignment = .fill
        stackViewList.distribution =  .equalSpacing
        stackViewList.spacing = 7
        return stackViewList
    }()
    
    lazy var additionalInfoContainer: UIView = {
        let viewContainer = UIView()
        
        let label = UILabel()
        label.text = "Готово"
        label.font = UIFont (name: "HelveticaNeue", size: 16)
        label.layer.borderColor = mainPink.cgColor
        label.layer.borderWidth = 3
        label.layer.cornerRadius = 10
        label.textAlignment = .center
        label.snp.makeConstraints { (make) in
            make.height.equalTo(35)
            make.width.equalTo(80)
        }
        
        let noteText = UILabel()
        noteText.text = "\(day.additionalInfo!)"
        noteText.numberOfLines = 0
        noteText.font = UIFont (name: "HelveticaNeue", size: 17)
        
        viewContainer.addSubview(label)
        viewContainer.addSubview(noteText)
        label.snp.makeConstraints { (make) in
            make.top.equalTo(viewContainer.snp.top)
            
        }
        noteText.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(15)
            make.left.equalTo(viewContainer.snp.left).offset(5)
            make.right.equalTo(viewContainer.snp.right)
            make.bottom.equalTo(viewContainer.snp.bottom)
        }
        return viewContainer
        
    }()
    
    lazy var importantNoteContainer: UIView = {
        let viewContainer = UIView()
        
        let label = UILabel()
        label.text = "Важно!"
        label.font = UIFont (name: "HelveticaNeue", size: 16)
        label.layer.borderColor = mainPink.cgColor
        label.layer.borderWidth = 3
        label.layer.cornerRadius = 10
        label.textAlignment = .center
        label.snp.makeConstraints { (make) in
            make.height.equalTo(35)
            make.width.equalTo(80)
        }
        
        let noteText = UILabel()
        noteText.text = "\(day.importantNote!)"
        noteText.numberOfLines = 0
        noteText.font = UIFont (name: "HelveticaNeue", size: 17)
        
        viewContainer.addSubview(label)
        viewContainer.addSubview(noteText)
        label.snp.makeConstraints { (make) in
            make.top.equalTo(viewContainer.snp.top)
            
        }
        noteText.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(15)
            make.left.equalTo(viewContainer.snp.left).offset(5)
            make.right.equalTo(viewContainer.snp.right)
            make.bottom.equalTo(viewContainer.snp.bottom)
        }
        
        return viewContainer
        
    }()
    
    
    lazy var nextDayBtn: UIButton = {
        let nextBtn = UIButton()
        nextBtn.setTitle("День \(day.whichDay + 1)", for: .normal)
        nextBtn.backgroundColor = mainBlue
        nextBtn.tintColor = .white
        nextBtn.layer.cornerRadius = 5
        nextBtn.snp.makeConstraints { (make) in
            make.height.equalTo(40)
        }
        return nextBtn
    }()
    
    
    
    
    
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUiElements()
        print(self.view.frame.height)
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
    
    func configureUiElements(){
        //Scroll View and Container VIew
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(view)
            make.left.equalTo(view)
            make.bottom.equalTo(view)
            make.right.equalTo(view)
            
        }
        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView)
            make.left.equalTo(scrollView)
            make.bottom.equalTo(scrollView)
            make.right.equalTo(scrollView)
            make.width.equalTo(scrollView.snp.width)
        }
        
        
        //mainTitleLabel
        containerView.addSubview(mainTitleLabel)
        mainTitleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(containerView).offset(20)
            make.left.equalTo(containerView).offset(20)
        }
        
        //howDoLabel
        containerView.addSubview(howDoLabel)
        howDoLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(15)
            make.left.equalTo(containerView).offset(20)
            make.height.equalTo(30)
            make.width.equalTo(140)
        }
        //stackViewListContainer
        containerView.addSubview(stackViewListContainer)
        stackViewListContainer.snp.makeConstraints { (make) in
            make.top.equalTo(howDoLabel.snp.bottom).offset(20)
            make.left.equalTo(containerView.snp.left).offset(20)
            make.right.equalTo(containerView.snp.right).offset(-20)
        }
        
        //stackViewList
        stackViewListContainer.addSubview(stackViewList)
        stackViewList.snp.makeConstraints { (make) in
            make.top.equalTo(stackViewListContainer.snp.top).offset(10)
            make.bottom.equalTo(stackViewListContainer.snp.bottom).offset(-10)
            make.left.equalTo(stackViewListContainer.snp.left).offset(10)
            make.right.equalTo(stackViewListContainer.snp.right).offset(-10)
        }
        
        //stackViewList
        generateStackViewListCell()
        
        
        if(day.additionalInfo != nil ) {
            //importantNoteLabel
            containerView.addSubview(additionalInfoContainer)
            additionalInfoContainer.snp.makeConstraints { (make) in
                make.left.equalTo(containerView.snp.left).offset(20)
                make.right.equalTo(containerView.snp.right).offset(-20)
                make.top.equalTo(stackViewListContainer.snp.bottom).offset(20)
            }
            
            //importantNoteContainer
            containerView.addSubview(importantNoteContainer)
            importantNoteContainer.snp.makeConstraints { (make) in
                make.left.equalTo(containerView.snp.left).offset(20)
                make.right.equalTo(containerView.snp.right).offset(-20)
                make.top.equalTo(additionalInfoContainer.snp.bottom).offset(20)
            }
        } else {
            //importantNoteContainer
            containerView.addSubview(importantNoteContainer)
            importantNoteContainer.snp.makeConstraints { (make) in
                make.left.equalTo(containerView.snp.left).offset(20)
                make.right.equalTo(containerView.snp.right).offset(-20)
                make.top.equalTo(stackViewListContainer.snp.bottom).offset(20)
            }
        }
        
        
        
        //nextDayBtn
        containerView.addSubview(nextDayBtn)
        nextDayBtn.snp.makeConstraints { (make) in
            make.top.equalTo(importantNoteContainer.snp.bottom).offset(20)
            make.left.equalTo(containerView.snp.left).offset(20)
            make.bottom.equalTo(containerView.snp.bottom).offset(-20)
            make.right.equalTo(containerView.snp.right).offset(-20)
            
        }
        
    }
    
    
    func generateStackViewListCell(){
        //stackViewListCell
        for (index, item) in day.tableListData!.enumerated() {
            let numLabel = UILabel()
            numLabel.text = "\(index + 1)"
            numLabel.textColor = .white
            numLabel.font = UIFont.boldSystemFont(ofSize: 24)
            
            let textLabel = UILabel()
            textLabel.numberOfLines = 0
            textLabel.font = UIFont (name: "HelveticaNeue", size: 16)
            textLabel.font = textLabel.font.withSize(18)
            textLabel.text = "\(item)"
            
            let stackViewListCell = UIStackView()
            stackViewListCell.axis = .horizontal
            stackViewListCell.backgroundColor = mainPink
            stackViewListCell.alignment = .center
            stackViewListCell.distribution =  .fillProportionally
            stackViewListCell.spacing = 10
            
            
            stackViewListCell.addArrangedSubview(numLabel)
            stackViewListCell.addArrangedSubview(textLabel)
            stackViewList.addArrangedSubview(stackViewListCell)
            
            stackViewListCell.snp.makeConstraints { (make) in
                make.left.equalTo(stackViewList.snp.left)
                make.right.equalTo(stackViewList.snp.right)
            }
            
        }
    }
    
}

extension UIStackView {
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}


