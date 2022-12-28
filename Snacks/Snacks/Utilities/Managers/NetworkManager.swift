//
//  NetworkManager.swift
//  Snacks
//
//  Created by Yavuz Güner on 24.12.2022.
//

import Foundation
import UIKit

final class NetworkManager{
    static let shared = NetworkManager()
    
    private let cache = NSCache<NSString,UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init(){
    }
    
//    func getAppetizers(completed:@escaping(Result<[Appetizer],APError>)->Void){
//        guard let url = URL(string: appetizerURL) else{
//            completed(.failure(.invalidURL))
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
//            if let _ = error { //Eğer _ error'sa dön değilse devam et olacak. guard let'te takılmıştı.
//                completed(.failure(.unableToComplete)) //Wifi çalışmama gibi sebeplerden olur
//                return
//            }
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
//                completed(.failure(.invalidResponse))
//                return
//            }
//            guard let data = data else{
//                completed(.failure(.invalidData))
//                return
//            }
//            //Hata durumlarının hepsini yazdıktan sonra olayın gerçekleşmesi durumunda yazacaklarımız bunlardır...
//            do{
//                let decoder = JSONDecoder()
//                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
//                //en yukarıda escaping'de tanımladığımız veriyle bağıntılı.
//                completed(.success(decodedResponse.request))
//            }
//            catch{
//                completed(.failure(.invalidData))
//            }
//        }
//        task.resume()
//    }
    
    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: appetizerURL) else{
            throw APError.invalidURL
        }
        let (data,_) = try await URLSession.shared.data(from: url)
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
//            if let _ = error { //Eğer _ error'sa dön değilse devam et olacak. guard let'te takılmıştı.
//                completed(.failure(.unableToComplete)) //Wifi çalışmama gibi sebeplerden olur
//                return
//            }
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
//               completed(.failure(.invalidResponse))
//                return
//
//            }
//            guard let data = data else{
//                completed(.failure(.invalidData))
//                return
//            }
            do{
                let decoder = JSONDecoder()
                return try decoder.decode(AppetizerResponse.self, from: data).request
//                completed(.success(decodedResponse.request))
//                return decodedResponse.request
            }
            catch{
//                completed(.failure(.invalidData))
                throw APError.invalidData
            }
        }
//        task.resume()
//    }
    
    func downloadImage(fromURLString urlString:String, completed: @escaping (UIImage?)->Void){
        //Buna istinaden bir cache tanımlıyoruz yukarıda
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString)  else{
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else{
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
    
}
