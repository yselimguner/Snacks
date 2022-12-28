//
//  AccountViewModel.swift
//  Snacks
//
//  Created by Yavuz Güner on 26.12.2022.
//

import SwiftUI

final class AccountViewModel:ObservableObject{
    @AppStorage("user") private var userData:Data?
    @Published var user = User()
    
    @Published var alertItem:AlertItem?
    
    func saveChanges(){
        guard isValidForm else{return}
        
        do{
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        }catch{
            alertItem = AlertContext.invalidUserData
        }
    }
    
    
    //Retrieve User
    func retrieveUser(){
        //eğer veri varsa daha önceden kayıtlı onları getireceğiz.
        
        guard let userData = userData else {return}
        
        do{
            user = try JSONDecoder().decode(User.self, from: userData)
        }catch{
            alertItem = AlertContext.invalidUserData
        }
        
    }
    
    //Yazılan verilerin kontrolü
    var isValidForm : Bool{
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    

    
}
