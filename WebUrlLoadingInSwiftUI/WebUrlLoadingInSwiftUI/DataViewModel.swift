//
//  DataViewModel.swift
//  WebUrlLoadingInSwiftUI
//
//  Created by Balaji A on 01/11/24.
//

import Foundation

class DataViewModel: ObservableObject {
    
    @Published var users: [User] = []
    
    func fetchData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([User].self, from: data)
                    DispatchQueue.main.async {
                        self.users = decodedData
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }.resume()
    }
}
// MARK: - User Entity
struct User: Codable, Identifiable {
    let id: Int
    let name: String
}
