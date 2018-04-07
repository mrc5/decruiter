//
//  NameCell.swift
//  decruiter
//
//  Created by Marcus on 19.03.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import UIKit

class NameCell: UITableViewCell {
    
    var textField: UITextField!
    var emoji: UILabel!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        emoji = UILabel()
        emoji.text = "ℬ"
        add(emoji)
        
        textField = UITextField()
        textField.placeholder = "Name"
        add(textField)
        
        emoji.translatesAutoresizingMaskIntoConstraints = false
        emoji.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        emoji.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        textField.leadingAnchor.constraint(equalTo: emoji.trailingAnchor, constant: 8).isActive = true
        textField.widthAnchor.constraint(equalToConstant: frame.width - 8).isActive = true
        textField.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textField.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
