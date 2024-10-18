import Foundation
import CloudKit

struct Person: Hashable {
    var name: String
    var age: Int
    var record: CKRecord
}
