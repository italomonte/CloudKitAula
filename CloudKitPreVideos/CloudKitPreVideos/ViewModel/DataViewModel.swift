//
//  DataViewModel.swift
//  CloudKitPreVideos
//
//  Created by Italo Guilherme Monte on 12/10/24.
//

import Foundation
import CloudKit

class DataViewModel: ObservableObject {
    
    var container = CKContainer.default()
    
    var privateDatabase: CKDatabase {
        container.privateCloudDatabase
    }
    
    var publicDatabase: CKDatabase {
        container.publicCloudDatabase
    }
    
    var sharedDatabase: CKDatabase {
        container.sharedCloudDatabase
    }
    
    init() {
//        publicDatabase.save(CKRecord.self)
//        publicDatabase.fetchAllRecordZones { recordZones, error in }
    }
}
