//
//  MenuOptionCell.swift
//  EnglishApp
//
//  Created by Muhamed Niyazov on 24.11.2020.
//  Copyright © 2020 Muhamed Niyazov. All rights reserved.
//

import UIKit
import SnapKit
class MenuOptionCell: UITableViewCell {
    // MARK: - Properties
    weak var viewModel: MenuOptionCellVMType! {
        willSet(viewModel){
            subtitile.text = "День \(viewModel!.whichDay)"
            titleLabel.text = " \(viewModel!.title)"
        }
    }
    
    lazy var subtitile: UILabel = {
        let label = UILabel()
        label.textColor = .mainBlue
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkText
        label.font = UIFont.systemFont(ofSize: 16)

        return label
        
    }()
    


    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(subtitile)
        subtitile.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(contentView).offset(20)
            make.right.equalTo(contentView)
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(subtitile.snp.bottom).offset(5)
            make.left.equalTo(contentView).offset(30)
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
}
