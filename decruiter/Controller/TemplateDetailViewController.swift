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
    
    lazy var imageView: UIImageView = {
        let img = UIImageView()
        img.hero.id = "detail"
        img.backgroundColor = .blue
        img.image = UIImage(named: "test")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var coverView: UIView = {
        let view = UIView()
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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
        setupView()
    }
    
    private func setData() {
        guard let template = template else { return }
        
    }
    
    private func setupView() {
        view.add(scrollView)
        view.add(closeButton)
        view.add(titleLabel)
        view.backgroundColor = .white
        scrollView.add(imageView)
        imageView.add(coverView)
        
        let constraints = [
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -16),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -16),
            coverView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            coverView.topAnchor.constraint(equalTo: imageView.topAnchor),
            coverView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            coverView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc
    func didTapClose() {
        self.dismiss(animated: true, completion: nil)
    }
}
