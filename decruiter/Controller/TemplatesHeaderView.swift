//
//  TemplatesHeaderView.swift
//  decruiter
//
//  Created by Marcus on 25.09.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import UIKit

class TemplatesHeaderView: UICollectionReusableView {
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    private var greetingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        add(dateLabel)
        add(greetingLabel)
        
        dateLabel.text = getDate()
        greetingLabel.text = "Hallo Marcus"
        
        setupContraints()
    }
    
    private func getDate() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "EEEE, d. MMMM yyyy"
        return formatter.string(from: Date()).uppercased()
    }
    
    private func setupContraints() {
        let constraints = [
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dateLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            greetingLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            greetingLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 16),
            greetingLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            greetingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
