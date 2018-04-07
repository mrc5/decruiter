//
//  ThankCell.swift
//  decruiter
//
//  Created by Marcus on 15.03.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import UIKit

class ThankCell: UITableViewCell {
    
    var thankButton: UIButton!
    var thankEvenMoreButton: UIButton!
    var emoji: UILabel!
    
    var buttonView: UIView!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        buttonView = UIView()
        self.add(buttonView)
        
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        
        buttonView.widthAnchor.constraint(equalToConstant: 188).isActive = true
        buttonView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        buttonView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        thankButton = UIButton()
        thankButton.setBackgroundColor(UIColor.blue, for: .selected)
        thankButton.setBackgroundColor(UIColor.gray, for: .normal)
        thankButton.setTitle("Danke", for: .normal)
        thankButton.setTitleColor(UIColor.white, for: .normal)
        thankButton.layer.cornerRadius = 10
        thankButton.clipsToBounds = true
        thankButton.addTarget(self, action: #selector(thankButtonTapped), for: .touchUpInside)
        buttonView.add(thankButton)
        
        thankEvenMoreButton = UIButton()
        thankEvenMoreButton.setBackgroundColor(UIColor.cyan, for: .selected)
        thankEvenMoreButton.setBackgroundColor(UIColor.gray, for: .normal)
        thankEvenMoreButton.setTitle("Vielen Dank!", for: .normal)
        thankEvenMoreButton.setTitleColor(UIColor.white, for: .normal)
        thankEvenMoreButton.layer.cornerRadius = 10
        thankEvenMoreButton.clipsToBounds = true
        thankEvenMoreButton.addTarget(self, action: #selector(thankEvenMoreButtonTapped), for: .touchUpInside)
        buttonView.add(thankEvenMoreButton)
        
        emoji = UILabel()
        emoji.text = "🙏🙏"
        add(emoji)
        
        emoji.translatesAutoresizingMaskIntoConstraints = false
        emoji.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        emoji.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        emoji.trailingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: -8).isActive = true
        
        thankButton.translatesAutoresizingMaskIntoConstraints = false
        thankEvenMoreButton.translatesAutoresizingMaskIntoConstraints = false
        
        thankButton.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor).isActive = true
        thankButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        thankButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        thankButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        thankEvenMoreButton.leadingAnchor.constraint(equalTo: thankButton.trailingAnchor, constant: 8).isActive = true
        thankEvenMoreButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        thankEvenMoreButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        thankEvenMoreButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    @objc func thankButtonTapped() {
        thankButton.isSelected = !thankButton.isSelected
        
        if thankEvenMoreButton.isSelected {
            thankEvenMoreButton.isSelected = false
        }
    }
    
    @objc func thankEvenMoreButtonTapped() {
        thankEvenMoreButton.isSelected = !thankEvenMoreButton.isSelected
        
        if thankButton.isSelected {
            thankButton.isSelected = false
        }
    }
}
