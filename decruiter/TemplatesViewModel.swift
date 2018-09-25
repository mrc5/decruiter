//
//  TemplatesViewModel.swift
//  decruiter
//
//  Created by Marcus on 20.09.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import Foundation
import CloudKit


class TemplatesViewModel {
    private let database = CKContainer.default().privateCloudDatabase
    
    var templates = [Template]() {
        didSet {
            self.notificationQueue.addOperation {
                self.onChange?()
            }
        }
    }
    
    var onChange : (() -> Void)?
    var onError : ((CKError) -> Void)?
    var notificationQueue = OperationQueue.main
    
    
    private func handle(_ error: CKError) {
        self.notificationQueue.addOperation {
            self.onError?(error)
        }
    }
    
    @objc
    func refresh() {
        let query = CKQuery(recordType: Template.recordType, predicate: NSPredicate(value: true))
        
        database.perform(query, inZoneWith: nil) { records, error in
            if let error = error as? CKError {
                self.handle(error)
            } else if let records = records {
                self.templates = records.map { record in Template(record: record) }
            }
        }
    }
    
    func addTemplate(_ salutation: String) {
        var template = Template()
        template.salutation = salutation
        
        database.save(template.record) { _, error in
            guard let error = error as? CKError else { print("Saving succeded!"); return }
            self.handle(error)
        }
    }
}
