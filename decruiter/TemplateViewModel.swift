//
//  TemplateViewModel.swift
//  decruiter
//
//  Created by Marcus on 21.07.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import Parse

protocol TemplateViewDelegate: class {
    func showData()
}

class TemplateViewModel {
    
    var templates: [PFObject] = []
    weak var viewDelegate: TemplateViewDelegate?

    init() {
        loadObjects()
    }
    
    private func loadObjects() {
        let query = PFQuery(className: "Templates")

        query.findObjectsInBackground { [weak self] (objects, error) in
            if let err = error {
                // Show Error
                print(err.localizedDescription)
            } else {
                guard let objects = objects else { return }
                self?.templates = objects
                
                for object in objects {
                    let name = object["title"] as! String
                    let tag = object["tag"] as! String
                    print("Object-Name: \(name) with Tag: \(tag)")
                }
                self?.viewDelegate?.showData()
            }
        }
    }
    
    func getNumberOfItemsInSection() -> Int {
        return templates.count
    }
    
    func getNumberOfSections() -> Int {
        return 1
    }
    
}
