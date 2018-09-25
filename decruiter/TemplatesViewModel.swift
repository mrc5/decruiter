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
}


class TemplatesViewModel {
    private let database = CKContainer.default().privateCloudDatabase
    
    weak var viewDelegate: TemplateViewDelegate?
    
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
}
