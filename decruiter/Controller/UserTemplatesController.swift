//
//  UserTemplatesController.swift
//  decruiter
//
//  Created by Marcus on 25.09.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import UIKit
import CloudKit

class UserTemplatesController: UIViewController {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
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
    
    let viewModel = PrivateTemplateViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupActivityIndicator()
        setupDataBinding()
    }
    
    private func setupDataBinding() {
        viewModel.viewDelegate = self
        viewModel.loadData()
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
        title = "My Templates"
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.alwaysBounceVertical = true
        view.add(collectionView)
        
        collectionView.register(TemplatesCell.self, forCellWithReuseIdentifier: "templatesCell")
        
        let constraints = [
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
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
}

extension UserTemplatesController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.privateTemplates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "templatesCell", for: indexPath) as! TemplatesCell
        cell.setupWith(viewModel.privateTemplates[indexPath.item])
        return cell
    }
}

extension UserTemplatesController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width - 32, height: 220)
    }
}

extension UserTemplatesController: PrivateTemplatesViewDelegate {
    func showError(_ error: CKError) {
        switch error.code {
        case .notAuthenticated:
            print("You are not authenticated!")
            showEmpty()
        default:
            print(error)
        }
    }
    
    func showData() {
        emptyLabel.removeFromSuperview()
        activityIndicator.stopAnimating()
        collectionView.reloadData()
    }
    
    func showEmpty() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.stopAnimating()
            self?.setupEmptyState()
        }
    }
}
