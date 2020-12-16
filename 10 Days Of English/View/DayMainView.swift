//
//  Day1.swift
//  EnglishApp
//
//  Created by Muhamed Niyazov on 25.11.2020.
//  Copyright © 2020 Muhamed Niyazov. All rights reserved.
//

import UIKit
import SnapKit

class DayMainView: UIView {
    //MARK: - Properties
    var viewModel: DayViewVMType!
    
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
        label.text = "\(viewModel.title)"
        label.font = UIFont (name: "HelveticaNeue-Light", size: 22)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var howDoLabel: UILabel = {
        let label = UILabel()
        label.text = "Как это делать?"
        label.font = UIFont (name: "HelveticaNeue", size: 16)
        label.layer.borderColor = UIColor.lightBlue.cgColor
        label.layer.borderWidth = 3
        label.layer.cornerRadius = 5
        label.textAlignment = .center
        return label
    }()
    
    lazy var stackViewListContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .lightBlue
        view.layer.cornerRadius = 10
        return view
    }()
    
    
    lazy var stackViewList: UIStackView = {
        let stackViewList = UIStackView()
        stackViewList.axis = .vertical
        stackViewList.alignment = .fill
        stackViewList.distribution =  .equalSpacing
        stackViewList.spacing = 7
        return stackViewList
    }()
    
    lazy var additionalInfoView: UIView = {
        guard let additionalIno = viewModel.additionalInfo else { return UIView() }
        let view = UtilitisUI().otherInfoView(nameInfo: "Готово", text: additionalIno)
        return view
    }()
    
    lazy var importantInfoVIew: UIView = {
        guard let importantView = viewModel.importantNote else { return UIView() }
        let view = UtilitisUI().otherInfoView(nameInfo: "Важно", text: importantView )
        return view
    }()
    lazy var nextDayBtn: UIButton = {
        let nextBtn = UIButton()
        nextBtn.setTitle("День \(viewModel.whichDay + 1)", for: .normal)
        nextBtn.backgroundColor = .mainPink
        nextBtn.tintColor = .white
        nextBtn.layer.cornerRadius = 5
        nextBtn.snp.makeConstraints { (make) in
            make.height.equalTo(40)
        }
        return nextBtn
    }()
    
    
    //MARK: - Init
    
    init(frame: CGRect, viewModel: DayViewVMType) {
        super.init(frame: frame)
        self.viewModel = viewModel
        configureUiElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
    func configureUiElements(){
        //Scroll View and Container VIew
        addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.edges.equalTo(scrollView).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
            make.width.equalTo(scrollView.snp.width)
            make.height.greaterThanOrEqualTo(scrollView.snp.height)
        }
        
        //mainTitleLabel
        containerView.addSubview(mainTitleLabel)
        mainTitleLabel.snp.makeConstraints { (make)  in
            make.top.equalTo(containerView).offset(20)
            make.left.equalTo(containerView)
            make.right.equalTo(containerView)
            
        }
        
        //howDoLabel
        containerView.addSubview(howDoLabel)
        howDoLabel.snp.makeConstraints { (make)  in
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(15)
            make.left.equalTo(containerView)
            make.height.equalTo(30)
            make.width.equalTo(140)
        }
        
        //stackViewListContainer
        containerView.addSubview(stackViewListContainer)
        stackViewListContainer.snp.makeConstraints { (make) in
            make.top.equalTo(howDoLabel.snp.bottom).offset(20)
            make.left.equalTo(containerView)
            make.right.equalTo(containerView)
        }
        
        //stackViewList
        stackViewListContainer.addSubview(stackViewList)
        stackViewList.snp.makeConstraints { (make) in
            make.top.equalTo(stackViewListContainer).offset(10)
            make.bottom.equalTo(stackViewListContainer).offset(-10)
            make.left.equalTo(stackViewListContainer).offset(10)
            make.right.equalTo(stackViewListContainer).offset(-10)
        }
        
        //stackViewListCell
        stackViewListCell()
        
        
        
        containerView.addSubview(nextDayBtn)
        nextDayBtn.snp.makeConstraints { (make) in
            
            make.bottom.equalTo(containerView.snp.bottom).offset(-20)
            make.left.equalTo(containerView)
            make.right.equalTo(containerView)
            
        }
        //additionalInfoLabel
        configureInfoViews()
        
        
        
    }
    
    func configureInfoViews() {
        func makeConstaint(element: UIView, equalTo: UIView){
            element.snp.makeConstraints { (make) in
                make.top.equalTo(equalTo.snp.bottom).offset(20)
                make.left.equalTo(containerView)
                make.right.equalTo(containerView)
            }
        }
        
        func makeConstrintForBtn(element: UIView){
            element.snp.makeConstraints { (make) in
                make.bottom.lessThanOrEqualTo(nextDayBtn.snp.top).offset(-20)
            }
        }
        let  additionalIno = viewModel.additionalInfo
        let  importantNote = viewModel.importantNote
        
        if(additionalIno != nil && importantNote != nil) {
            containerView.addSubview(additionalInfoView)
            makeConstaint(element: additionalInfoView, equalTo: stackViewListContainer)
            containerView.addSubview(importantInfoVIew)
            makeConstaint(element: importantInfoVIew, equalTo: additionalInfoView)
            makeConstrintForBtn(element: importantInfoVIew)
            return
        } else if(additionalIno != nil) {
              print("DEBUG: dwfwe")
            containerView.addSubview(additionalInfoView)
            makeConstaint(element: additionalInfoView, equalTo: stackViewListContainer)
            makeConstrintForBtn(element: additionalInfoView)
        } else if(importantNote != nil) {
            containerView.addSubview(importantInfoVIew)
            makeConstaint(element: importantInfoVIew, equalTo: stackViewListContainer)
            makeConstrintForBtn(element: importantInfoVIew)
        } else {
            makeConstrintForBtn(element: stackViewListContainer)
        }
        
    }
    
    func stackViewListCell() {
        let stackViews = UtilitisUI().generateStackViewListCell(listData: viewModel.listData)
        for item in stackViews {
            stackViewList.addArrangedSubview(item)
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
