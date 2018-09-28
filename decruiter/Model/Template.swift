//
//  Template.swift
//  decruiter
//
//  Created by Marcus on 20.09.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import Foundation
import CloudKit

struct Template {
    static let recordType = "Template"
    static let keys = (salutation : "salutation")
    
    var record: CKRecord
    
    init(record: CKRecord) {
        self.record = record
    }
    
    init() {
        self.record = CKRecord(recordType: Template.recordType)
    }
    
    var salutation : String {
        get {
            return self.record.value(forKey: Template.keys.salutation) as! String
        }
        set {
            self.record.setValue(newValue, forKey: Template.keys.salutation)
        }
    }
}
