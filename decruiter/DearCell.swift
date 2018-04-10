//
//  DearCell.swift
//  decruiter
//
//  Created by Marcus on 15.03.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import UIKit

class DearCell: UITableViewCell {
    
    var sirButton: UIButton!
    var madamButton: UIButton!
    var buttonView: UIView!
    var emoji: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    private func setupView() {
        buttonView = UIView()
        self.add(buttonView)
        
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        
        buttonView.widthAnchor.constraint(equalToConstant: 128).isActive = true
        buttonView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        buttonView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        sirButton = UIButton()
        sirButton.setBackgroundColor(UIColor.blue, for: .selected)
        sirButton.setBackgroundColor(UIColor.gray, for: .normal)
        sirButton.setTitle("Herr", for: .normal)
        sirButton.setTitleColor(UIColor.white, for: .normal)
        sirButton.layer.cornerRadius = 10
        sirButton.clipsToBounds = true
        sirButton.addTarget(self, action: #selector(sirButtonTapped), for: .touchUpInside)
        buttonView.add(sirButton)
        
        madamButton = UIButton()
        madamButton.setBackgroundColor(UIColor.gray, for: .normal)
        madamButton.setBackgroundColor(UIColor.red, for: .selected)
        madamButton.setTitle("Frau", for: .normal)
        madamButton.setTitleColor(UIColor.white, for: .normal)
        madamButton.layer.cornerRadius = 10
        madamButton.clipsToBounds = true
        madamButton.addTarget(self, action: #selector(madamButtonTapped), for: .touchUpInside)
        buttonView.add(madamButton)
        
        emoji = UILabel()
        emoji.text = "🙋‍♀️🙋‍♂️"
        add(emoji)
        
        emoji.translatesAutoresizingMaskIntoConstraints = false
        emoji.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        emoji.trailingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: -8).isActive = true
        emoji.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        
        sirButton.translatesAutoresizingMaskIntoConstraints = false
        madamButton.translatesAutoresizingMaskIntoConstraints = false
        
        sirButton.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor).isActive = true
        sirButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor).isActive = true
        sirButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        sirButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        madamButton.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor).isActive = true
        madamButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor).isActive = true
        madamButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        madamButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    @objc func sirButtonTapped() {
        sirButton.isSelected = !sirButton.isSelected
        
        if madamButton.isSelected {
            madamButton.isSelected = false
        }
        
        if sirButton.isSelected {
            Composer.dear = .mr
        } else {
            Composer.dear = nil
        }
    }
    
    @objc func madamButtonTapped() {
        madamButton.isSelected = !madamButton.isSelected
        
        if sirButton.isSelected {
            sirButton.isSelected = false
        }
        
        if madamButton.isSelected {
            Composer.dear = .mrs
        } else {
            Composer.dear = nil
        }
    }
}
