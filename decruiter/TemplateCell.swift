//
//  TemplateCell.swift
//  decruiter
//
//  Created by Marcus on 28.04.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import UIKit

class TemplateCell: UITableViewCell {
    var message = UILabel()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureAt(_ indexPath: IndexPath) {
        
    }
}
