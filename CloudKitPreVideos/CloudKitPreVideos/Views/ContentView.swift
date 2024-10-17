//
//  ContentView.swift
//  CloudKitPreVideos
//
//  Created by Italo Guilherme Monte on 12/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var dataVM = DataViewModel()
    
    var body: some View {
        VStack {
            Text("\(dataVM.msg)")
                .foregroundStyle(dataVM.isSignInToiCloud ? .green : .red)
                .bold()
                .font(.headline)
            
            Circle()
                .frame(width: 20)
                .foregroundStyle(dataVM.isSignInToiCloud ? .green : .red)
                
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
