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
    
    private var offlineIndicatorView: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "round_cloud_off_black")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.addTarget(self, action: #selector(didTapCloudButton), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.backgroundColor = UIColor.white
        
        add(dateLabel)
        add(greetingLabel)
        add(offlineIndicatorView)
        
        dateLabel.text = getDate()
        greetingLabel.text = "Hallo Marcus"
        
        setupContraints()
    }
    
    private func getDate() -> String {
        let formatter = DateFormatter()
        let locale = Locale.init(identifier: "DE")
        formatter.locale = locale
        formatter.dateFormat = "EEEE, d. MMMM yyyy"
        return formatter.string(from: Date()).uppercased()
    }
    
    private func setupContraints() {
        let constraints = [
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dateLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            greetingLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            greetingLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            greetingLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            greetingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            offlineIndicatorView.centerYAnchor.constraint(equalTo: greetingLabel.centerYAnchor),
            offlineIndicatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            offlineIndicatorView.heightAnchor.constraint(equalToConstant: 30),
            offlineIndicatorView.widthAnchor.constraint(equalToConstant: 30)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc
    func didTapCloudButton() {
        print("CloudButtonTapped")
    }
}
