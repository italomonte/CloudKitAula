
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
    
    @Published var isSignInToiCloud: Bool = false
    @Published var msg: String = ""
    
    init() {
        getiCloudStatus()

    }
    
    func getiCloudStatus() {
        
            self.container.accountStatus { returnedStatus, error in
                DispatchQueue.main.async {
                    switch returnedStatus {
                        
                        case .available:
                            self.isSignInToiCloud = true
                            self.msg = "Accont Found"
                        
                        case .noAccount:
                            self.msg = "iCloudAccontNotFound"
                        
                        case .couldNotDetermine:
                            self.msg = "iCloudAccontNotDetermined"
                        
                        case .restricted:
                            self.msg = "iCloudAccontRestricted"
                        
                        default:
                            self.msg = "iCloudAccontUnknown"

                    }
                }
            }
        }
}
