//
//  TemplatesController.swift
//  decruiter
//
//  Created by Marcus on 28.04.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import UIKit

class TemplatesController: UIViewController {
    var tableView: UITableView!
    
    let viewModel = TemplatesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.title = "Templates"
        view.backgroundColor = UIColor.white
        
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(TemplateCell.self, forCellReuseIdentifier: "TemplatesCell")
        view.add(tableView)
    }
    
    @objc private func closeView() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension TemplatesController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TemplatesCell", for: indexPath) as! TemplateCell
        return cell
    }
}
