import SwiftUI

struct ContentView: View {
    
    @ObservedObject var dataVM = DataViewModel()
    
    var body: some View {
        VStack {
            Text("\(dataVM.status)")
                .foregroundStyle(.red)
                .bold()
                .font(.headline)
            
            Circle()
                .frame(width: 20)
                .foregroundStyle(dataVM.isSigned ? .green : .red)
                
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
