//
//  RemoteImage.swift
//  Snacks
//
//  Created by Yavuz Güner on 25.12.2022.
//

import SwiftUI

final class ImageLoader:ObservableObject{
    @Published var image: Image? = nil //Image eğer değişirse başarılı bir kod olmuştur.
    
    func load(fromURLString urlString:String){
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
             //Boş olma ihtimaline istinaden gelir gelmez versiyonlarını yazacağız.
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

//RemoteImage'ın görüntüsünü yazdıracağız.

struct RemoteImage:View{
    
    var image : Image?
    
    var body: some View{
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct AppetizerRemoteImage:View{
    
    @StateObject var imageLoader = ImageLoader()
    let urlString:String
    
    var body: some View{
        RemoteImage(image: imageLoader.image)
            .onAppear{
                imageLoader.load(fromURLString: urlString)
            }
    }
}
//Bu yağtığımız herşeyi AppetizerListCell'de işleriz ki görüntü gelsin artık.
