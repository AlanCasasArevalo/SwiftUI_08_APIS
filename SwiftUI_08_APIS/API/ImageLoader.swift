

import SwiftUI
import Combine
import Foundation

class ImageLoader: ObservableObject {
    
    var didChange = PassthroughSubject<Data, Never>()
    
    @Published var userData = Data() {
        didSet {
            didChange.send(userData)
        }
    }
    
    init(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                guard let dataDes = data else { return }
                DispatchQueue.main.async {
                    self.userData = dataDes
                }
            }
        }
        .resume()
    }
}
