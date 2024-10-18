//
//  ContentView.swift
//  CloudKitPreVideos
//
//  Created by Italo Guilherme Monte on 12/10/24.
//

import SwiftUI

struct MenuView: View {
    
    @ObservedObject var dataVM = DataViewModel()
    
    var body: some View {
        
        NavigationStack {
            VStack{
                NavigationLink { CrudView(dataVM: dataVM) }
                label: { Text("Crud") }
            }
            .navigationTitle("Menu")
            .toolbar {
                ToolbarItem{
                    HStack {
                        Text("\(dataVM.msg)")
                            .foregroundStyle(dataVM.isSignInToiCloud ? .green : .red)
                            .bold()
                            .font(.headline)
                        
                        Circle()
                            .frame(width: 20)
                            .foregroundStyle(dataVM.isSignInToiCloud ? .green : .red)
                              
                    }
                }
            }
        }
        .padding()
    }
}
