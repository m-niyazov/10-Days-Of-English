//
//  UtilitisUI.swift
//  10 Days Of English
//
//  Created by Muhamed Niyazov on 15.12.2020.
//  Copyright © 2020 Muhamed Niyazov. All rights reserved.
//

import Foundation
import UIKit

class UtilitisUI {
    //DayMainView
    func generateStackViewListCell(listData: [String]) -> [UIStackView] {
        var stackViews = [UIStackView]()
        for (index, item) in listData.enumerated() {
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
            stackViewListCell.backgroundColor = .mainPink
            stackViewListCell.alignment = .top
            
            stackViewListCell.spacing = 10
            
            
            stackViewListCell.addArrangedSubview(numLabel)
            stackViewListCell.addArrangedSubview(textLabel)
            
            numLabel.snp.makeConstraints { (make) in
                make.width.equalTo(15)
            }
            stackViews.append(stackViewListCell)
        }
        return stackViews
    }
    
    
       func otherInfoView(nameInfo: String, text: String ) -> UIView {
             let viewContainer = UIView()
             
             let label = UILabel()
             label.text = nameInfo
             label.font = UIFont (name: "HelveticaNeue", size: 16)
             label.layer.borderColor = UIColor.mainPink.cgColor
             label.layer.borderWidth = 3
             label.layer.cornerRadius = 10
             label.textAlignment = .center
   
             label.snp.makeConstraints { (make) in
                 make.height.equalTo(35)
                 make.width.equalTo(80)
             }
             
             let noteText = UILabel()
             noteText.text = "\(text)"
             noteText.numberOfLines = 0
             noteText.font = UIFont (name: "HelveticaNeue", size: 17)
             
             viewContainer.addSubview(label)
             viewContainer.addSubview(noteText)
        
             label.snp.makeConstraints { (make) in
                 make.top.equalTo(viewContainer.snp.top)
                 make.left.equalTo(viewContainer)
                
                 
             }
             noteText.snp.makeConstraints { (make) in
                 make.top.equalTo(label.snp.bottom).offset(15)
                 make.left.equalTo(viewContainer.snp.left).offset(5)
                 make.right.equalTo(viewContainer.snp.right)
                 make.bottom.equalTo(viewContainer.snp.bottom)
             }
           
             return viewContainer
             
         }
}
