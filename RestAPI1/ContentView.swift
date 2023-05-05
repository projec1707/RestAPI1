// https://dummy.restapiexample.com
// https://rapidapi.com

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    EmployeeView()
                } label: {
                    HStack {
                        Text("Employees")
                            .font(.headline)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding()
                    .background(Color.blue.opacity(0.1))
                }
                Spacer()
            }
            .navigationTitle("Fetching Data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
