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
        textField = UITextField()
        textField.placeholder = "Name"
        textField.delegate = self
        add(textField)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        textField.widthAnchor.constraint(equalToConstant: frame.width - 50).isActive = true
        textField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        emoji = UILabel()
        emoji.text = "📝📝"
        add(emoji)
        
        emoji.translatesAutoresizingMaskIntoConstraints = false
        emoji.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        emoji.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        emoji.trailingAnchor.constraint(equalTo: textField.leadingAnchor, constant: -8).isActive = true
    }
}

extension NameCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let name = textField.text else { return }
        Composer.updateName(name)
    }
}
