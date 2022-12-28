//
//  EmptyState.swift
//  Snacks
//
//  Created by Yavuz Güner on 26.12.2022.
//

import SwiftUI

struct EmptyState: View {
    
    let imageName:String
    let message:String
    
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .padding()
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            //.offset(y:-30)
            //Bu aşağı yukarı kaydırma için extra bir özellik. 
        }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState(imageName: "empty-order", message: "You have no items in your order.")
    }
}

//"empty-order"
//"You have no items in your order."
