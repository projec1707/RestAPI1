

import Foundation

enum Link {
    case employees
    
    var url: URL {
        switch self {
        case .employees:
            return URL(string: "https://dummy.restapiexample.com/api/v1/employees")!
        }
    }
}

final class NetworkManager: ObservableObject {
    
    init() {}
    
    static let shared = NetworkManager()
    
    @Published var employees = [Employee]()
    
    func fetchEmployees() {
        print("try to fetch")
        
       // let url = URL(string: "https://dummy.restapiexample.com/api/v1/employees")!
        let fetchRequest = URLRequest(url: Link.employees.url)
        
        URLSession.shared.dataTask(with: fetchRequest) { [weak self] (data, response, error) -> Void in
            if error != nil {
                print("Error is session is not nil")
            } else {
                // We've got data!
                
                let httpResponse = response as? HTTPURLResponse
                print("status code: \(String(describing: httpResponse?.statusCode))")
                
                // проверяем существуют ли вообще данные
                guard let safeData = data else { return }
                
                // попытка декодировать данные
                if let decodedQuery = try? JSONDecoder().decode(Query.self, from: safeData) {
                    
                    // тепень нашему Published var employees присваием данные которые
                    // мы декодировали
                    
                    DispatchQueue.main.async { // записываем данные в основном потоке
                        // так как URLSession.shared.dataTask выполняется в бэкграунде
                        self?.employees = decodedQuery.data
                    }
                    
                }
            }
        }.resume()
    }
}
