//
//  Person.swift
//  CloudKitPreVideos
//
//  Created by Italo Guilherme Monte on 12/10/24.
//

import Foundation
import CloudKit

struct Person: Hashable {
    var name: String
    var age: Int
    var record: CKRecord
}
