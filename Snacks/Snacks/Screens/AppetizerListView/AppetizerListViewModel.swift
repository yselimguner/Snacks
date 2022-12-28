//
//  AppetizerListViewModel.swift
//  Snacks
//
//  Created by Yavuz Güner on 24.12.2022.
//

import Foundation

@MainActor final class AppetizerListViewModel:ObservableObject{
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem : AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false //TapGesture'den sonra yazarız.
    @Published var selectedAppetizer:Appetizer?

    
//    func getAppetizers(){
//        isLoading = true
//        NetworkManager.shared.getAppetizers { [self] result in //Self yazmaktaki amacımız error caselerinde yaşadığımız sıkıntı ile alakalı
//            DispatchQueue.main.async { [self] in
//                isLoading = false
//                switch result{
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                    //Yukarıda boş tanımladığımız array'e atarız gelen appetizers verisini...
//                case.failure(let error):
//                    switch error{
//                    case .invalidResponse :
//                        alertItem = AlertContext.invalidResponse
//
//                    case .invalidURL:
//                        alertItem = AlertContext.invalidURL
//
//                    case .invalidData:
//                        alertItem = AlertContext.invalidData
//
//                    case .unableToComplete:
//                        alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }
    //Yeni hali burada
    func getAppetizers(){
        isLoading = true
        
        Task{
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            }catch{
                if let apError = error as? APError{
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }else{
                    alertItem = AlertContext.invalidResponse
                }
                isLoading = false
            }
        }
       
    }
}


