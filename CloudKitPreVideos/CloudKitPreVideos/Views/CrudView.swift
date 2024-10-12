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
                        
                  
        }
        .navigationTitle("Crud")
        .padding()
    }
}

