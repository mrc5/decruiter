//
//  TemplatesController.swift
//  decruiter
//
//  Created by Marcus on 25.09.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import Hero
import UIKit
import CloudKit

class TemplatesController: UIViewController {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .gray)
        ai.hidesWhenStopped = true
        ai.translatesAutoresizingMaskIntoConstraints = false
        return ai
    }()
    
    lazy var emptyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.semibold)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private let viewModel = TemplatesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupActivityIndicator()
        setupCollectionView()
        setupDataBinding()
        setupView()
        
        self.hero.isEnabled = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
    private func setupActivityIndicator() {
        collectionView.add(activityIndicator)
        
        let constraints = [
            activityIndicator.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
        activityIndicator.startAnimating()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor.white
        self.title = "Templates"
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.alwaysBounceVertical = true
        
        collectionView.register(TemplatesCell.self, forCellWithReuseIdentifier: "templatesCell")
        collectionView.register(TemplatesHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "templatesHeader")
        
        view.add(collectionView)
        
        let constraints = [
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupDataBinding() {
        viewModel.viewDelegate = self
    }
    
    private func setupEmptyState() {
        view.add(emptyLabel)
        
        emptyLabel.text = "Leider sind aktuell keine Templates vorhanden"
        
        let constraints = [
            emptyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emptyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            emptyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupDetailWith(_ template: Template) {
        let controller = TemplateDetailViewController()
        controller.template = template
        self.present(controller, animated: true, completion: nil)
    }
}

extension TemplatesController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.publicTemplates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "templatesCell", for: indexPath) as! TemplatesCell
        cell.setupWith(viewModel.publicTemplates[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let template = viewModel.publicTemplates[indexPath.item]
        setupDetailWith(template)
    }
}

extension TemplatesController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "templatesHeader", for: indexPath) as! TemplatesHeaderView
            header.setupView()
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 96)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width - 32, height: 220)
    }
}

extension TemplatesController: TemplatesViewDelegate {
    func showEmpty() {
        activityIndicator.stopAnimating()
        setupEmptyState()
    }
    
    func showData() {
        emptyLabel.removeFromSuperview()
        activityIndicator.stopAnimating()
        collectionView.reloadData()
    }
    
    func showError(_ error: CKError) {
        switch error.code {
        case .notAuthenticated:
            print("You are not authenticated!")
        default:
            print(error)
        }
    }
}
