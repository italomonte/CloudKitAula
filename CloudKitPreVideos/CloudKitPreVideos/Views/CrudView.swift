//
//  ContentView.swift
//  CloudKitPreVideos
//
//  Created by Italo Guilherme Monte on 12/10/24.
//

import SwiftUI

struct CrudView: View {
    
    @ObservedObject var crudVM: CrudViewModel
    
    init(dataVM: DataViewModel) {
        self.crudVM = CrudViewModel(dataVM: dataVM)
        self.crudVM.fetch()
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
            
            List {
                ForEach (crudVM.personsList, id: \.self) { person  in
                    Text(person.name)
                        .onTapGesture {
                            crudVM.updatePerson(person: person)
                        }
                }.onDelete(perform: crudVM.deleteItem)
            }

                        
                  
        }
        .navigationTitle("Crud")
        .padding()
    }
}

