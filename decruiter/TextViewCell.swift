//
//  TextViewCell.swift
//  decruiter
//
//  Created by Marcus on 14.03.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import UIKit

class TextViewCell: UITableViewCell {
    var textView: UITextView!
    var composerDelegate: ComposerDelegate!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupTextView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func setupTextView() {
        textView = UITextView(frame: .zero)
        textView.text = "Hier steht die Vorschau"
        textView.delegate = self
        self.add(textView)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        textView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        textView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
}

extension TextViewCell: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = nil
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.text = "Hier steht die Vorschau"
    }
}
