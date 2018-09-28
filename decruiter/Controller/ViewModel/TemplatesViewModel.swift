//
//  TemplatesViewModel.swift
//  decruiter
//
//  Created by Marcus on 20.09.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import Foundation
import CloudKit

protocol TemplateViewDelegate: class {
    func showError(_ error: CKError)
    func showData()
    func showEmpty()
}


class TemplatesViewModel {
    weak var viewDelegate: TemplateViewDelegate?
    
    init() {
        refreshPublic()
    }
    
    var templates = [Template]() {
        didSet {
            self.notificationQueue.addOperation {
               self.viewDelegate?.showData()
            }
        }
    }
    var notificationQueue = OperationQueue.main
    
    
    private func handle(_ error: CKError) {
        self.notificationQueue.addOperation {
            self.viewDelegate?.showError(error)
        }
    }

    func refreshPublic() {
        let query = CKQuery(recordType: Template.recordType, predicate: NSPredicate(value: true))
        
        iCloudHelper.publicDatabase.perform(query, inZoneWith: nil) { [weak self] records, error in
            if let error = error as? CKError {
                self?.handle(error)
            } else if let records = records {
                let templates = records.map { record in Template(record: record) }
                
                DispatchQueue.main.async {
                    if templates.isEmpty {
                        self?.viewDelegate?.showEmpty()
                    } else {
                        self?.templates = templates
                    }
                }
            }
        }
    }
    
    func addToPrivateDatabase(_ template: Template) {
        let record = CKRecord(recordType: Template.recordType)
        record.setValue(template.salutation, forKey: Template.keys.salutation)
        
        iCloudHelper.privateDatabase.save(record) { [weak self] (_, error) in
            if let error = error as? CKError {
                self?.handle(error)
            }
        }
    }
}
