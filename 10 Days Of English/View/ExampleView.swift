//
//  ExampleView.swift
//  10 Days Of English
//
//  Created by Muhamed Niyazov on 14.12.2020.
//  Copyright © 2020 Muhamed Niyazov. All rights reserved.
//

import UIKit

class ExampleView: UIView {
    
    let vLabel: UILabel = {
        let label = UILabel()
        label.text = "Someone text1111"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
           
           addSubview(vLabel)
           
           vLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
               
           }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
