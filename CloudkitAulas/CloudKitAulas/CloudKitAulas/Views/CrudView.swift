import Foundation
import SwiftUI

struct CrudView: View {
    
    @ObservedObject var crudVM: CrudViewModel
    
    init(dataVM: DataViewModel) {
        self.crudVM = CrudViewModel(dataVM: dataVM)
        
    }
    
    var body: some View {
        VStack {
            
            TextField("Name", text: $crudVM.name)
            
            Picker("Age", selection: $crudVM.age) {
                ForEach(1..<90) { age in
                    Text("\(age)").tag(age)
                }
            }
            .pickerStyle(.wheel)
            .padding()
            
            Button {
                crudVM.save()
            } label: {
                Text("Save")
            }
            
            Button {
                crudVM.fetch()
            } label: {
                Text("FETCH")
            }
            
            List {
                ForEach (crudVM.personsList, id: \.self) { person  in
                    Text(person.name)
                        .onTapGesture {
                            crudVM.update(person: person)
                        }
                }
            }
            
            


                  
        }
        
        .navigationTitle("Crud")
        .padding()
    }
}
