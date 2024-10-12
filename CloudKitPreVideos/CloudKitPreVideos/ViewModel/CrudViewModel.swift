//
//  DataViewModel.swift
//  CloudKitPreVideos
//
//  Created by Italo Guilherme Monte on 12/10/24.
//

import Foundation
import CloudKit

class CrudViewModel: ObservableObject {
    
    var dataVM: DataViewModel
    var name: String = ""
    var age: Int = 0
    
    init(dataVM: DataViewModel) {
        self.dataVM = dataVM
    }
    
    func save() {
        
        let personRecord =  CKRecord(recordType: "person")

        personRecord["name"] = name
        personRecord["age"] = age
        
        dataVM.container.publicCloudDatabase.save(personRecord) { record  , error in
            if let error = error {
                print("Não foi possivel salvation: \(error.localizedDescription)")
            } else {
                print("Registro salvado com sucesso")
            }
            
        }
    }
}
