//
//  MyTemplatesViewModel.swift
//  decruiter
//
//  Created by Marcus on 03.10.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import CloudKit

protocol TemplatesViewDelegate: class {
    func showError(_ error: CKError)
    func showData()
    func showEmpty()
}

class TemplatesViewModel {
    weak var viewDelegate: TemplatesViewDelegate?
    
    var publicTemplates = [Template]() {
        didSet {
            self.notificationQueue.addOperation {
                self.viewDelegate?.showData()
            }
        }
    }
    
    var privateTemplates = [Template]() {
        didSet {
            self.notificationQueue.addOperation {
                self.viewDelegate?.showData()
            }
        }
    }
    
    init() {
        refreshPublic()
        refreshPrivate()
    }
    
    var notificationQueue = OperationQueue.main
    
    
    private func handle(_ error: CKError) {
        self.notificationQueue.addOperation {
            self.viewDelegate?.showError(error)
        }
    }
    
    func constructSectionCount() -> Int {
        return 1
    }
    
    
    private func refreshPrivate() {
        let query = CKQuery(recordType: Template.recordType, predicate: NSPredicate(value: true))
        
        iCloudHelper.privateDatabase.perform(query, inZoneWith: nil) { [weak self] (records, error) in
            if let error = error as? CKError {
                self?.handle(error)
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
    
    private func refreshPublic() {
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
                        self?.publicTemplates = templates
                    }
                }
            }
        }
    }
    
    func addToPrivateDatabase(_ template: Template) {
        let record = CKRecord(recordType: Template.recordType)
        record.setValue(template.salutation, forKey: Template.keys.salutation)
        record.setValue(template.recordId, forKey: Template.keys.recordId)
        
        iCloudHelper.privateDatabase.save(record) { [weak self] (_, error) in
            if let error = error as? CKError {
                self?.handle(error)
            }
        }
    }
    
    func deleteFromPrivateDatabase(_ template: Template) {
        let record = CKRecord(recordType: Template.recordType)
        record.setValue(template.salutation, forKey: Template.keys.salutation)
        record.setValue(template.recordId, forKey: Template.keys.recordId)
        
        iCloudHelper.privateDatabase.delete(withRecordID: record.recordID) { [weak self] (_, error) in
            if let error = error as? CKError {
                self?.handle(error)
            }
        }
    }
}
