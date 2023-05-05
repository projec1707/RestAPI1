

import SwiftUI

struct EmployeeView: View {
    @StateObject var networkManager = NetworkManager.shared
    
    @State private var employees = [Employee]()
  //  @State private var employees = [Employee.example]
    
    var body: some View {
        ZStack {
            List(employees, id: \.self) { employee in
                VStack {
                    Text("Employee ID\(employee.id)")
                    HStack {
                        Text(employee.employee_name)
                        Spacer()
                        Text(employee.employee_salary, format: .number)
                    }
                }
            }
            .onAppear {
                networkManager.fetchEmployees { result in
                    switch result {
                    case .success(let decodedEmployees):
                        print("success")
                        employees = decodedEmployees
                    case .failure(let networkError):
                        print("failure: \(networkError)")
                    }
                }
            }
        }
    }
}

struct EmployeeView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeView()
    }
}
