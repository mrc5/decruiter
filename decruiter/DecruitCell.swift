//
//  DecruitCell.swift
//  decruiter
//
//  Created by Marcus on 07.04.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import UIKit

class DecruitCell: UITableViewCell {
    private let emoji = UILabel()
    private let buttonView = UIView()
    let neverButton = UIButton()
    let notAtTheMomentButton = UIButton()

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
        
        buttonView.widthAnchor.constraint(equalToConstant: 238).isActive = true
        buttonView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        buttonView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        emoji.text = "🙅‍♀️🙅‍♂️"
        add(emoji)
        
        emoji.translatesAutoresizingMaskIntoConstraints = false
        emoji.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        emoji.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        emoji.trailingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: -8).isActive = true
        
        neverButton.setBackgroundColor(UIColor.blue, for: .selected)
        neverButton.setBackgroundColor(UIColor.gray, for: .normal)
        neverButton.setTitle("Niemals", for: .normal)
        neverButton.setTitleColor(UIColor.white, for: .normal)
        neverButton.layer.cornerRadius = 10
        neverButton.clipsToBounds = true
        neverButton.addTarget(self, action: #selector(neverButtonTapped), for: .touchUpInside)
        buttonView.add(neverButton)
        
        notAtTheMomentButton.setBackgroundColor(UIColor.cyan, for: .selected)
        notAtTheMomentButton.setBackgroundColor(UIColor.gray, for: .normal)
        notAtTheMomentButton.setTitle("Nicht im Moment", for: .normal)
        notAtTheMomentButton.setTitleColor(UIColor.white, for: .normal)
        notAtTheMomentButton.layer.cornerRadius = 10
        notAtTheMomentButton.clipsToBounds = true
        notAtTheMomentButton.addTarget(self, action: #selector(notAtTheMomentButtonTapped), for: .touchUpInside)
        buttonView.add(notAtTheMomentButton)
        
        neverButton.translatesAutoresizingMaskIntoConstraints = false
        notAtTheMomentButton.translatesAutoresizingMaskIntoConstraints = false
        
        neverButton.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor).isActive = true
        neverButton.widthAnchor.constraint(equalToConstant: 78).isActive = true
        neverButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        neverButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        notAtTheMomentButton.leadingAnchor.constraint(equalTo: neverButton.trailingAnchor, constant: 8).isActive = true
        notAtTheMomentButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        notAtTheMomentButton.widthAnchor.constraint(equalToConstant: 152).isActive = true
        notAtTheMomentButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    @objc func neverButtonTapped() {
        neverButton.isSelected = !neverButton.isSelected
        
        if notAtTheMomentButton.isSelected {
            notAtTheMomentButton.isSelected = false
        }
        Composer.updateDecruit(Decruit.never)
    }
    
    @objc func notAtTheMomentButtonTapped() {
        notAtTheMomentButton.isSelected = !notAtTheMomentButton.isSelected
        
        if neverButton.isSelected {
            neverButton.isSelected = false
        }
        Composer.updateDecruit(Decruit.notAtTheMoment)
    }
}
