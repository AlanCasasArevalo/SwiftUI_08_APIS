
import SwiftUI

struct CustomImageView: View {
    
    @ObservedObject var imageLoader: ImageLoader
    
    init(imageUrl: String) {
        imageLoader = ImageLoader.init(imageUrl: imageUrl)
    }
    
    var body: some View {
        Image(uiImage: (((imageLoader.userData.count == 0) ? UIImage(systemName: "photo") : UIImage(data: imageLoader.userData))! ))
            .frame(width: 100, height: 100, alignment: .center)
            .background(Color(.systemGray5))
            .cornerRadius(50)
        
    }
}

struct CustomImageView_Previews: PreviewProvider {
    static var previews: some View {
        CustomImageView(imageUrl: "")
    }
}
