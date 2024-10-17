import Foundation
import CloudKit

class CrudViewModel: ObservableObject {
    
    var dataVM: DataViewModel
    
    init(dataVM: DataViewModel) {
        self.dataVM = dataVM
    }
    
    @Published var name: String = ""
    @Published var age: Int = 0
    
    func save() {
        
        let personRecord = CKRecord(recordType: "person")
        
        if name == "" || age == 0 {
            return
        }
        
        personRecord["name"] = name
        personRecord["age"] = age
        
        dataVM.container.publicCloudDatabase.save(personRecord) { record  , error in
            if let error = error {
                print("Não foi possivel salvar: \(error.localizedDescription)")
            } else {
                print("Registro salvo com sucesso")
                print(record?.recordID.recordName ?? "oi")
            }
            
        }
        
        name = ""
        age = 1
        
    }
    
}
