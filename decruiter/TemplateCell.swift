//
//  TemplateCell.swift
//  decruiter
//
//  Created by Marcus on 21.07.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import UIKit

class TemplateCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWith(_ viewModel: TemplateViewModel, indexPath: IndexPath) {
        
    }
}
