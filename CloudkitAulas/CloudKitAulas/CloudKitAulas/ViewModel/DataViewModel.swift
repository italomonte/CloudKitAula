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
    
    @Published var status: String = ""
    @Published var isSigned: Bool = false
    
    init() {
        iCloudStatus()
    }
    
    func iCloudStatus() {
        
        self.container.accountStatus { status, error in
            DispatchQueue.main.async {
                switch status {
                case .available:
                    self.status = "iCloud is available"
                    self.isSigned = true
                    
                case .noAccount:
                    self.status =  "iCloud Account not Found"
                    self.isSigned = false

                case .couldNotDetermine:
                    self.status = "Could not determine iCloud status"
                    self.isSigned = false

                case .restricted:
                    self.status = "iCloud is restricted"
                    self.isSigned = false

                case .temporarilyUnavailable:
                    self.status = "iCloud is temporarily unavailable"
                    self.isSigned = false
                
                default:
                    self.status = "Account Unknown"
                    self.isSigned = false

                        
                }
            }
        }
        
    }
    
    
}
