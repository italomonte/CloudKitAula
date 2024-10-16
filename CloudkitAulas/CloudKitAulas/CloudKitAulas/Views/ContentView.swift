import SwiftUI

struct ContentView: View {
    
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
                        Text("\(dataVM.status)")
                            .foregroundStyle(dataVM.isSigned ? .green : .red)
                            .bold()
                            .font(.headline)
                        
                        Circle()
                            .frame(width: 20)
                            .foregroundStyle(dataVM.isSigned ? .green : .red)
                              
                    }
                }
            }
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
