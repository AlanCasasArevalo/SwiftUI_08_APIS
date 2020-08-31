

import SwiftUI
import Combine

class NetworkingManager: ObservableObject {
    
    var didChange = PassthroughSubject<NetworkingManager, Never>()
    
    @Published var usersList = UsersListEntity(data: []) {
        // property observers
        didSet {
            didChange.send(self)
        }
    }
    
    init() {
        guard let urlDes = URL(string: "https://reqres.in/api/users?page=2") else { return }
        URLSession.shared.dataTask(with: urlDes) { (data, response, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                do {
                    guard let dataDes = data else { return }
                    let result = try JSONDecoder().decode(UsersListEntity.self, from: dataDes)
                    DispatchQueue.main.async {
                        self.usersList = result
                    }
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
        }
        .resume()
    }
    
}
