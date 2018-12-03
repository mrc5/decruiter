//
//  TemplateDetailViewController.swift
//  decruiter
//
//  Created by Marcus on 25.10.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import Hero
import UIKit

class TemplateDetailViewController: UIViewController {
    
    var template: Template?
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .blue
        img.image = UIImage(named: "test")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var coverView: UIView = {
        let view = UIView()
        view.hero.id = "detail"
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var closeButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "round_close_black")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
        return btn
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.bold)
        label.textColor = .white
        label.numberOfLines = 3
        label.text = "Bestes Template der Welt. Es steckt hier einfach so viel Gutes drin. blalbalsdjflkasnflkjsdaklfjldska"
        return label
    }()
    
    lazy var salutationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.bold)
        label.textColor = .black
        return label
    }()
    
    lazy var thanksLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.regular)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    lazy var decruitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.regular)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    lazy var byeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.regular)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    lazy var ownNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.regular)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Für später speichern", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.darkGray, for: .highlighted)
        button.layer.cornerRadius = 22
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(saveButtonDidTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
        setData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupView()
    }
    
    private func setData() {
//        guard let template = template else { return }
        salutationLabel.text = "Hallo Frau Recruiterin"
        thanksLabel.text = "Vielen Dank für Ihre Anfrage und Ihr Interesse an meinen Fähigkeiten."
        decruitLabel.text = "Im Moment bin ich nicht an einem Wechsel interessiert und muss Ihnen für die vakante Position leider absagen. Im Moment bin ich nicht an einem Wechsel interessiert und muss Ihnen für die vakante Position leider absagen. Im Moment bin ich nicht an einem Wechsel interessiert und muss Ihnen für die vakante Position leider absagen."
        byeLabel.text = "Beste Grüße und vielen Dank,"
        ownNameLabel.text = "Marcus Hopp"
    }
    
    private func setupView() {
        view.add(scrollView)
        view.backgroundColor = .white
        
        scrollView.add(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(coverView)
        contentView.addSubview(closeButton)
        contentView.addSubview(salutationLabel)
        contentView.addSubview(thanksLabel)
        contentView.addSubview(decruitLabel)
        contentView.addSubview(byeLabel)
        contentView.addSubview(ownNameLabel)
        
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            
            coverView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            coverView.topAnchor.constraint(equalTo: imageView.topAnchor),
            coverView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            coverView.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1),
            
            closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            
            salutationLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            salutationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            salutationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

            thanksLabel.topAnchor.constraint(equalTo: salutationLabel.bottomAnchor, constant: 16),
            thanksLabel.leadingAnchor.constraint(equalTo: salutationLabel.leadingAnchor),
            thanksLabel.trailingAnchor.constraint(equalTo: salutationLabel.trailingAnchor),

            decruitLabel.topAnchor.constraint(equalTo: thanksLabel.bottomAnchor, constant: 8),
            decruitLabel.leadingAnchor.constraint(equalTo: thanksLabel.leadingAnchor),
            decruitLabel.trailingAnchor.constraint(equalTo: thanksLabel.trailingAnchor),

            byeLabel.topAnchor.constraint(equalTo: decruitLabel.bottomAnchor, constant: 8),
            byeLabel.leadingAnchor.constraint(equalTo: decruitLabel.leadingAnchor),
            byeLabel.trailingAnchor.constraint(equalTo: decruitLabel.trailingAnchor),

            ownNameLabel.topAnchor.constraint(equalTo: byeLabel.bottomAnchor, constant: 8),
            ownNameLabel.leadingAnchor.constraint(equalTo: byeLabel.leadingAnchor),
            ownNameLabel.trailingAnchor.constraint(equalTo: byeLabel.trailingAnchor),
            ownNameLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -72),
            
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            saveButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc
    func didTapClose() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    func saveButtonDidTapped() {
        
    }
}
