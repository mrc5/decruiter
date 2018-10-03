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
    
    let viewModel = TemplatesViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
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
}

extension UserTemplatesController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.privateTemplates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "templatesCell", for: indexPath) as! TemplatesCell
        cell.setupWith(viewModel, template: viewModel.privateTemplates[indexPath.item], type: .privateType)
        return cell
    }
}

extension UserTemplatesController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width - 32, height: 220)
    }
}

extension UserTemplatesController: TemplatesViewDelegate {
    func showError(_ error: CKError) {
        
    }
    
    func showData() {
        
    }
    
    func showEmpty() {
        
    }
}
