//
//  Order.swift
//  Snacks
//
//  Created by Yavuz Güner on 26.12.2022.
//

import SwiftUI

final class Order:ObservableObject{
    //viewModel ile benzer konseptte
    @Published var items:[Appetizer] = []
    
    //Hesaplama işlemi
    var totalPrice:Double{
        items.reduce(0){ $0 + $1.price }
    }
    
    func add (_ appetizer:Appetizer){
        items.append(appetizer)
    }
    
    func deleteItems(at offsets:IndexSet){ //Yukarıda .onDelete kod bloğu kalabalık olmasın diye yazdık.
        items.remove(atOffsets:offsets)
    }
}

