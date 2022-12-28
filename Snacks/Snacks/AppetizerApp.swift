//
//  SnacksApp.swift
//  Snacks
//
//  Created by Yavuz Güner on 24.12.2022.
//

import SwiftUI

@main
struct AppetizerApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
