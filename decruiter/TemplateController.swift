//
//  TemplateController.swift
//  decruiter
//
//  Created by Marcus on 21.07.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import UIKit
import Parse

class TemplateController: UIViewController {
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private var emptyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var emptyViewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.medium)
        label.textAlignment = .center
        label.numberOfLines = 3
        label.text = "Es wurde keine Templates gefunden. Versuchen Sie es später erneut."
        return label
    }()
    
    var viewModel: TemplateViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Templates"
        setupCollectionView()
        
        viewModel = TemplateViewModel()
        viewModel?.viewDelegate = self
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        setupEmptyScreen()
    }
    
    private func setupCollectionView() {
        
        collectionView.contentInset = UIEdgeInsetsMake(8, 8, 8, 8)
        collectionView.alwaysBounceVertical = true
        
        collectionView.backgroundColor = UIColor.groupTableViewBackground
        collectionView.register(TemplateCell.self, forCellWithReuseIdentifier: "TemplateCell")
        view.add(collectionView)
    
        let constraints = [
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupEmptyScreen() {
        view.add(emptyView)
        emptyView.add(emptyViewLabel)
        
        emptyView.isHidden = true
        
        let constraints = [
            emptyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emptyView.topAnchor.constraint(equalTo: view.topAnchor),
            emptyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emptyView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            emptyViewLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor),
            emptyViewLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor),
            emptyViewLabel.leadingAnchor.constraint(equalTo: emptyView.leadingAnchor, constant: 40),
            emptyViewLabel.trailingAnchor.constraint(equalTo: emptyView.trailingAnchor, constant: -40)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

extension TemplateController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.getNumberOfSections()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.getNumberOfItemsInSection()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TemplateCell", for: indexPath) as! TemplateCell
        
        guard let viewModel = viewModel else { return UICollectionViewCell() }
        cell.setupWith(viewModel, indexPath: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension TemplateController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let title = viewModel?.templates[indexPath.item]["title"] as? String else { return CGSize.zero }
        let titleWidth: CGFloat = CGFloat(title.count) * 11.0
        return CGSize(width: titleWidth, height: 50)
    }
}

extension TemplateController: TemplateViewDelegate {
    
    func showData() {
        guard let count = viewModel?.templates.count else { return }
        if count > 0 {
            emptyView.isHidden = true
            collectionView.reloadData()
        } else {
            emptyView.isHidden = false
        }
    }
}
