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
    private let kThxByeButton = UIButton()
    private let thankyouSOmuchByeButton = UIButton()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
    }

}
