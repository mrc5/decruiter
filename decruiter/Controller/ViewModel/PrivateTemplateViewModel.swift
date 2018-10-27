//
//  PrivateTemplateViewModel.swift
//  decruiter
//
//  Created by Marcus on 20.10.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import CloudKit

protocol PrivateTemplatesViewDelegate: class {
    func showError(_ error: CKError)
    func showData()
    func showEmpty()
}

class PrivateTemplateViewModel {
    
    weak var viewDelegate: PrivateTemplatesViewDelegate?
    
    var privateTemplates = [Template]() 
    
    private func handle(_ error: CKError) {
        self.viewDelegate?.showError(error)
    }
    
    func constructSectionCount() -> Int {
        return 1
    }
    
     func loadData() {
        let query = CKQuery(recordType: Template.recordType, predicate: NSPredicate(value: true))
    
        iCloudHelper.privateDatabase.perform(query, inZoneWith: nil) { [weak self] (records, error) in
            if let error = error as? CKError {
                self?.viewDelegate?.showError(error)
            } else if let records = records {
                let templates = records.map { record in Template(record: record) }
    
                DispatchQueue.main.async {
                    if templates.isEmpty {
                        self?.viewDelegate?.showEmpty()
                    } else {
                        self?.privateTemplates = templates
                    }
                }
            }
        }
    }
}
