import Foundation
import CloudKit

class CrudViewModel: ObservableObject {
    
    var dataVM: DataViewModel
    
    init(dataVM: DataViewModel) {
        self.dataVM = dataVM
    }
    
    @Published var name: String = ""
    @Published var age: Int = 1
    
    @Published var personsList: [Person] = []

    
    func save() {
        
        let personRecord =  CKRecord(recordType: "person")

        if name == "" || age == 0 {
            return
        }
        
        personRecord["name"] = name
        personRecord["age"] = age
        
        dataVM.container.publicCloudDatabase.save(personRecord) { record  , error in
            if let error = error {
                print("Não foi possivel salvation: \(error.localizedDescription)")
            } else {
                print("Registro salvo com sucesso")
                self.fetch()
            }
            
        }
        
        self.name = ""
        self.age = 1
    }
    
    func fetch() {
        
        let predicate = NSPredicate(value: true)
        
        let query = CKQuery(recordType: "person", predicate: predicate)
        
        //Implementar returnedPersons
        var returnedPersons: [Person] = []
        
        dataVM.publicDatabase.fetch(withQuery: query) { result in
            
            switch result {
            case .success(let (matchResults, queryCursor)):

                for (recordID, recordResult) in matchResults {
                    switch recordResult {
                    case .success(let record):
                        print("Registro encontrado: \(String(describing: record["name"]))")
                        let person = Person(name: record["name"] as! String, age: record["age"] as! Int, record: record)
                        
                        returnedPersons.append(person)
                        
                        
                    case .failure(let error):
                        print("Erro ao buscar o registro com ID \(recordID): \(error)")
                    }
                }
                
                DispatchQueue.main.async {
                    self.personsList = returnedPersons
                }

                if let _ = queryCursor {
                    print("Há mais resultados para buscar usando este cursor.")
                }
            case .failure(let error):
                print("Erro ao realizar a consulta: \(error)")
            }
        }
        
    }
    
    
    func updatePerson (person: Person) {
        let record = person.record
        record["name"] = "New Name!"
        
        dataVM.container.publicCloudDatabase.save(record) { record  , error in
            if let error = error {
                print("Não foi possivel salvation: \(error.localizedDescription)")
            } else {
                print("Registro salvo com sucesso")
                self.fetch()
            }
            
        }

    }
}
