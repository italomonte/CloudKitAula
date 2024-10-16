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
  
}
