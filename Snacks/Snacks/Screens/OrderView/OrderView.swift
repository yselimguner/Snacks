//
//  OrderView.swift
//  Snacks
//
//  Created by Yavuz Güner on 24.12.2022.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order:Order
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List{
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(.plain)
                    Button {
                        print("Tapped Orderd")
                    } label: {
                        //APButton(title:  "$\(order.totalPrice, specifier: " %.2f") - Place Order ")
                        Text("$\(order.totalPrice, specifier: " %.2f") - Place Order ")
                    }
                    .modifier(StandartButtonStyle())
                        .padding(.bottom,25)
                }
                if order.items.isEmpty{
                    EmptyState(imageName: "empty-order", message: "You have no items in your order.\nPlease add an appetizer!")
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
    //func deleteItems(at offsets:IndexSet){ //Yukarıda .onDelete kod bloğu kalabalık olmasın diye yazdık.
     //   order.items.remove(atOffsets:offsets)
    //}  BU kod bloğunuu order'a taşıdık.
}


struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
