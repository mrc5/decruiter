//
//  ByeCell.swift
//  decruiter
//
//  Created by Marcus on 07.04.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import UIKit

class ByeCell: UITableViewCell {
    
    private let emoji = UILabel()
    private let buttonView = UIView()
    let kThxByeButton = UIButton()
    let thankyouSOmuchByeButton = UIButton()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.add(buttonView)
        
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        
        buttonView.widthAnchor.constraint(equalToConstant: 256).isActive = true
        buttonView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        buttonView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        emoji.text = "🙋‍♀️🙋‍♂️"
        add(emoji)
        
        emoji.translatesAutoresizingMaskIntoConstraints = false
        emoji.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        emoji.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        emoji.trailingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: -8).isActive = true
        
        kThxByeButton.setBackgroundColor(UIColor.blue, for: .selected)
        kThxByeButton.setBackgroundColor(UIColor.gray, for: .normal)
        kThxByeButton.setTitle("K Thx bye", for: .normal)
        kThxByeButton.setTitleColor(UIColor.white, for: .normal)
        kThxByeButton.layer.cornerRadius = 10
        kThxByeButton.clipsToBounds = true
        kThxByeButton.addTarget(self, action: #selector(kThxByeButtonTapped), for: .touchUpInside)
        buttonView.add(kThxByeButton)
        
        thankyouSOmuchByeButton.setBackgroundColor(UIColor.cyan, for: .selected)
        thankyouSOmuchByeButton.setBackgroundColor(UIColor.gray, for: .normal)
        thankyouSOmuchByeButton.setTitle("Danke nochmal, bye", for: .normal)
        thankyouSOmuchByeButton.setTitleColor(UIColor.white, for: .normal)
        thankyouSOmuchByeButton.layer.cornerRadius = 10
        thankyouSOmuchByeButton.clipsToBounds = true
        thankyouSOmuchByeButton.addTarget(self, action: #selector(thankYouSOmuchByeButtonTapped), for: .touchUpInside)
        buttonView.add(thankyouSOmuchByeButton)
        
        kThxByeButton.translatesAutoresizingMaskIntoConstraints = false
        thankyouSOmuchByeButton.translatesAutoresizingMaskIntoConstraints = false
        
        kThxByeButton.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor).isActive = true
        kThxByeButton.widthAnchor.constraint(equalToConstant: 84).isActive = true
        kThxByeButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        kThxByeButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        thankyouSOmuchByeButton.leadingAnchor.constraint(equalTo: kThxByeButton.trailingAnchor, constant: 8).isActive = true
        thankyouSOmuchByeButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        thankyouSOmuchByeButton.widthAnchor.constraint(equalToConstant: 164).isActive = true
        thankyouSOmuchByeButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    @objc func kThxByeButtonTapped() {
        kThxByeButton.isSelected = !kThxByeButton.isSelected
        
        if thankyouSOmuchByeButton.isSelected {
            thankyouSOmuchByeButton.isSelected = false
        }
    }
    
    @objc func thankYouSOmuchByeButtonTapped() {
        thankyouSOmuchByeButton.isSelected = !thankyouSOmuchByeButton.isSelected
        
        if kThxByeButton.isSelected {
            kThxByeButton.isSelected = false
        }
    }
}
