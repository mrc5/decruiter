//
//  ViewController.swift
//  decruiter
//
//  Created by Marcus on 14.03.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import UIKit

class GenerateViewController: UIViewController {
    
    var onboardingWasShown: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "onboardingWasShown")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "onboardingWasShown")
        }
    }
    
    lazy var tableView = UITableView()
    
    let data = [["textView"], ["dear", "name", "thank", "decruit", "kThxBye", "ownName"]]
    let copyButton = UIButton()
    let confirmationAlertView = UIView()
    
    var content: String? {
        didSet {
            showCopyButton()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        setupButton()
        disableButton()
        hideKeyboardWhenTappedAround()
        setupConfirmationAlert()

        self.title = "decruiter"
        
        let barButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresh))
        self.navigationItem.rightBarButtonItem = barButton
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        if !onboardingWasShown {
            setupOnboardingAlert()
        }
    }
    
    private func setupOnboardingAlert() {
        let title = "Hallo!"
        let message = "Du willst in Windeseile eine Antwort erstellen? Kein Problem!\nNur eine kurze Information für dich: Der Tap auf den Kopieren-Button kopiert die zu sendende Nachricht in deine Zwischenablage.\nSichere also mögliche Daten die du noch brauchst!"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel) { [weak self] (action) in
            self?.onboardingWasShown = true
        }
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func keyboardWillShow(_ notification:Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            tableView.contentInset = UIEdgeInsetsMake(0, 0, keyboardSize.height, 0)
        }
    }
    
    @objc func keyboardWillHide(_ notification:Notification) {
        if ((notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    private func showCopyButton() {
        enableButton()
    }
    
    @objc func refresh() {
        let textViewCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! TextViewCell
        let dearCell = tableView.cellForRow(at: IndexPath(row: 0, section: 1)) as! DearCell
        dearCell.madamButton.isSelected = false
        dearCell.sirButton.isSelected = false
        let nameCell = tableView.cellForRow(at: IndexPath(row: 1, section: 1)) as! NameCell
        nameCell.textField.text = nil
        let thankCell = tableView.cellForRow(at: IndexPath(row: 2, section: 1)) as! ThankCell
        thankCell.thankButton.isSelected = false
        thankCell.thankEvenMoreButton.isSelected = false
        let decruitCell = tableView.cellForRow(at: IndexPath(row: 3, section: 1)) as! DecruitCell
        decruitCell.neverButton.isSelected = false
        decruitCell.notAtTheMomentButton.isSelected = false
        let byeCell = tableView.cellForRow(at: IndexPath(row: 4, section: 1)) as! ByeCell
        byeCell.kThxByeButton.isSelected = false
        byeCell.thankyouSOmuchByeButton.isSelected = false
        let ownNameCell = tableView.cellForRow(at: IndexPath(row: 5, section: 1)) as! OwnNameCell
        ownNameCell.textField.text = nil

        Composer.data = ["", "", "", "", "", ""]
        tableView.reloadData()
        textViewCell.textView.text = "Hier steht die Vorschau"
        disableButton()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor.groupTableViewBackground
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.groupTableViewBackground
        tableView.separatorInset = UIEdgeInsetsMake(0, 50, 0, 0)
        tableView.alwaysBounceVertical = true
        
        tableView.register(TextViewCell.self, forCellReuseIdentifier: "TextViewCell")
        tableView.register(DearCell.self, forCellReuseIdentifier: "DearCell")
        tableView.register(ThankCell.self, forCellReuseIdentifier: "ThankCell")
        tableView.register(NameCell.self, forCellReuseIdentifier: "NameCell")
        tableView.register(DecruitCell.self, forCellReuseIdentifier: "DecruitCell")
        tableView.register(ByeCell.self, forCellReuseIdentifier: "ByeCell")
        tableView.register(OwnNameCell.self, forCellReuseIdentifier: "OwnNameCell")
        
        view.add(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func enableButton() {
        copyButton.isEnabled = true
        copyButton.setBackgroundColor(UIColor.blue, for: .normal)
        copyButton.setTitle("📥 kopieren", for: .normal)
        copyButton.setTitleColor(UIColor.white, for: .normal)
    }
    
    private func disableButton() {
        copyButton.isEnabled = false
        copyButton.setTitle("kopieren", for: .disabled)
        copyButton.setTitleColor(UIColor.lightGray, for: .disabled)
        copyButton.setBackgroundColor(UIColor.gray, for: .disabled)
    }
    
    private func setupButton() {
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
        guard let string = content else { return }
        UIPasteboard.general.string = string
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: { [weak self] in
            self?.confirmationAlertView.alpha = 1
        }) { (finished) in
            UIView.animate(withDuration: 1.8, animations: { [weak self] in
                self?.confirmationAlertView.alpha = 0
            })
        }
    }
    
    private func setupConfirmationAlert() {
        confirmationAlertView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.8)
        confirmationAlertView.alpha = 0
        confirmationAlertView.layer.cornerRadius = 10
        tableView.add(confirmationAlertView)
        
        let label = UILabel()
        label.text = "👍"
        label.font = UIFont.boldSystemFont(ofSize: 48)
        confirmationAlertView.add(label)
        
        confirmationAlertView.translatesAutoresizingMaskIntoConstraints = false
        confirmationAlertView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmationAlertView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        confirmationAlertView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 4).isActive = true
        confirmationAlertView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 4).isActive = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: confirmationAlertView.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: confirmationAlertView.centerXAnchor).isActive = true
    }
}

extension GenerateViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
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
            Composer.updated = {
                let text = "\(Composer.data[0]) \(Composer.data[1])\n\n\(Composer.data[2])\n\(Composer.data[3])\n\n\(Composer.data[4])\n\(Composer.data[5])"
                cell.textView.text = text
                self.content = text
            }
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
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "DecruitCell", for: indexPath) as! DecruitCell
                cell.selectionStyle = .none
                return cell
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ByeCell", for: indexPath) as! ByeCell
                cell.selectionStyle = .none
                return cell
            case 5:
                let cell = tableView.dequeueReusableCell(withIdentifier: "OwnNameCell", for: indexPath) as! OwnNameCell
                return cell
            default:
                break
            }
        default:
            assertionFailure("Section out of bounds")
        }
        return UITableViewCell()
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
        case 3:
            return 50
        case 4:
            return 50
        case 5:
            return 50
        default:
            return 0
        }
    }
}

