//
//  TemplatesCell.swift
//  decruiter
//
//  Created by Marcus on 25.09.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import UIKit

class TemplatesCell: UICollectionViewCell {
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        label.textColor = UIColor.white
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "test")
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 15
        iv.clipsToBounds = true
        return iv
    }()
    
    private var coverView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    private var saveButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cloud_dl"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.setImage(UIImage(named: "cloud_filled"), for: .selected)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var templateViewModel: TemplatesViewModel!
    var template: Template!
    
    @objc func saveButtonTapped() {
//        templateViewModel.addToPrivateDatabase(template)
        saveButton.isSelected = !saveButton.isSelected
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.layer.cornerRadius = 15
        add(imageView)
        imageView.add(coverView)
        add(titleLabel)
        add(saveButton)
        titleLabel.text = "Bestes Template der Welt. Es steckt hier einfach so viel Gutes drin. blalbalsdjflkasnflkjsdaklfjldska"
        
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        setupConstraints()
    }
    
    private func setupConstraints() {
        let constraints = [
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            coverView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            coverView.topAnchor.constraint(equalTo: imageView.topAnchor),
            coverView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            coverView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            titleLabel.trailingAnchor.constraint(equalTo: saveButton.leadingAnchor, constant: -8),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            saveButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            saveButton.heightAnchor.constraint(equalToConstant: 40),
            saveButton.widthAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupWith(_ viewModel: TemplatesViewModel, template: Template) {
        self.templateViewModel = viewModel
        self.template = template
    }
}
