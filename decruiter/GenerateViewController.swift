//
//  ViewController.swift
//  decruiter
//
//  Created by Marcus on 14.03.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import UIKit

class GenerateViewController: UIViewController {
    
    lazy var tableView = UITableView()
    
    let data = [["textView"], ["dear", "name", "thank"]]
    let copyButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        setupButton()
        hideKeyboardWhenTappedAround()

        self.title = "decruiter"
    }
    
    private func setupView() {
        view.backgroundColor = UIColor.groupTableViewBackground
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.groupTableViewBackground
        tableView.separatorInset = UIEdgeInsetsMake(0, 8, 0, 0)
        tableView.alwaysBounceVertical = true
        
        tableView.register(TextViewCell.self, forCellReuseIdentifier: "TextViewCell")
        tableView.register(DearCell.self, forCellReuseIdentifier: "DearCell")
        tableView.register(ThankCell.self, forCellReuseIdentifier: "ThankCell")
        tableView.register(NameCell.self, forCellReuseIdentifier: "NameCell")
        
        view.add(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupButton() {
        copyButton.backgroundColor = UIColor.blue
        copyButton.setTitle("📥 kopieren", for: .normal)
        copyButton.setTitleColor(UIColor.white, for: .normal)
        copyButton.setTitleColor(UIColor.gray, for: .highlighted)
        copyButton.addTarget(self, action: #selector(copyButtonDidTapped), for: .touchUpInside)
        view.add(copyButton)
        
        copyButton.translatesAutoresizingMaskIntoConstraints = false
        copyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        copyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        copyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        copyButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    @objc func copyButtonDidTapped() {
        
    }
}

extension GenerateViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        switch section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextViewCell", for: indexPath) as! TextViewCell
            cell.selectionStyle = .none
            return cell
        case 1:
            let row = indexPath.row
            switch row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "DearCell", for: indexPath) as! DearCell
                cell.selectionStyle = .none
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath) as! NameCell
                cell.selectionStyle = .none
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ThankCell", for: indexPath) as! ThankCell
                cell.selectionStyle = .none
                return cell
            default:
                break
            }
        default:
            assertionFailure("Section out of bounds")
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return nil
        case 1:
            return "Herr oder Frau?"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        
        switch section {
        case 0:
            return 150
        case 1:
            return 50
        case 2:
            return 50
        default:
            return 0
        }
    }
}

