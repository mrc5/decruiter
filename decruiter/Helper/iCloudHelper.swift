//
//  iCloudHelper.swift
//  decruiter
//
//  Created by Marcus on 25.09.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import UIKit
import CloudKit

class iCloudHelper {
    
    static var status = CKAccountStatus.couldNotDetermine
    
    static let privateDatabase = CKContainer.default().privateCloudDatabase
    static let publicDatabase = CKContainer.default().publicCloudDatabase
    
    class func checkForICloud() {
        CKContainer.default().accountStatus { (accountStatus, error) in
            switch accountStatus {
            case .available:
                print("iCloud Available")
                status = accountStatus
            case .noAccount:
                print("No iCloud account")
                status = accountStatus
            case .restricted:
                print("iCloud restricted")
                status = accountStatus
            case .couldNotDetermine:
                print("Unable to determine iCloud status")
                status = accountStatus
            }
        }
    }
}
