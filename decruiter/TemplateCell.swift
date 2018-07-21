//
//  TemplateCell.swift
//  decruiter
//
//  Created by Marcus on 21.07.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import UIKit

class TemplateCell: UICollectionViewCell {
    
    var titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .red
    
        setupView()
    }
    
    private func setupView() {
        self.layer.cornerRadius = 5
        
        titleLabel.numberOfLines = 1
        titleLabel.textColor = UIColor.white
        add(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let titleConstraints = [
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        NSLayoutConstraint.activate(titleConstraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWith(_ viewModel: TemplateViewModel, indexPath: IndexPath) {
        guard let title = viewModel.templates[indexPath.item]["title"] as? String else { return }
        titleLabel.text = title
    }
}
