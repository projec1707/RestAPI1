

import Foundation

struct Employee: Decodable, Hashable {
    var id = UUID()
    let employee_name: String
    let employee_salary: Int
}

struct Query: Decodable {
    let status: String
    let data: [Employee]
}

extension Employee {
    static let example = Employee(
      //  id: 1,
        employee_name: "Tim Cook",
        employee_salary: 30000)
}
