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
    
    static var iCloudStatus = CKAccountStatus.couldNotDetermine
    
    class func checkForICloud() {
        CKContainer.default().accountStatus { (accountStatus, error) in
            switch accountStatus {
            case .available:
                print("iCloud Available")
                iCloudStatus = accountStatus
            case .noAccount:
                print("No iCloud account")
                iCloudStatus = accountStatus
            case .restricted:
                print("iCloud restricted")
                iCloudStatus = accountStatus
            case .couldNotDetermine:
                print("Unable to determine iCloud status")
                iCloudStatus = accountStatus
            }
        }
    }
}
