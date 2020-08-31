
import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkingManager = NetworkingManager()
    
    
    /**
     let id: Int?
     let email, firstName, avatar, lastName: String?
     
     enum CodingKeys: String, CodingKey {
     case id, email
     case firstName = "first_name"
     case lastName = "last_name"
     case avatar
     }
     }
     */
    
    var body: some View {
        NavigationView {
            List(self.networkingManager.usersList.data ?? [], id: \.id) { user in
                HStack {
                    HStack {
                        CustomImageView(imageUrl: user.avatar ?? "")
                        VStack {
                            Text(user.firstName ?? "")
                                .font(.system(.subheadline))
                                .bold()
                            Text(user.email ?? "")
                                .font(.subheadline)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
