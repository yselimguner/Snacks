//
//  ContentView.swift
//  Snacks
//
//  Created by Yavuz Güner on 24.12.2022.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order:Order
    
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem { //Eski versyionlarda böyle yapıyorduk.
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
            OrderView()
                .tabItem {
                    Label("Orders", systemImage: "bag")
                }
                .badge(order.items.count)
        }
        //.accentColor(.brandPrimary) //asset'te ayarladık bu koda gerek yok daha.
    }
}

struct AppetizerTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabView()
    }
}
