//
//  MenuOptionCell.swift
//  EnglishApp
//
//  Created by Muhamed Niyazov on 24.11.2020.
//  Copyright © 2020 Muhamed Niyazov. All rights reserved.
//

import UIKit

class MenuOptionCell: UITableViewCell {
    // MARK: - Properties
    
    var subtitile: UILabel = {
        let label = UILabel()
        label.textColor = blue
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "День 1"
        
        return label
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Simple text"
        return label
        
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
 
      
        addSubview(subtitile)
        subtitile.translatesAutoresizingMaskIntoConstraints = false
        subtitile.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        subtitile.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        subtitile.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: subtitile.bottomAnchor, constant: 5).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
    
      
        
        
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
}
