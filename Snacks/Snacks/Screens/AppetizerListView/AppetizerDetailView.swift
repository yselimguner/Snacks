//
//  AppetizerDetailView.swift
//  Snacks
//
//  Created by Yavuz Güner on 25.12.2022.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order:Order
    
    let appetizer : Appetizer
    @Binding var isShowingDetail:Bool
    
    var body: some View {
        VStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            Text(appetizer.name)
                .font(.title2)
                .fontWeight(.semibold)
            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .font(.body)
                .padding()
            HStack(spacing: 40){
                NutritionsInfo(title: "Calories", value: appetizer.calories)
                NutritionsInfo(title: "Carbs", value: appetizer.carbs)
                NutritionsInfo(title: "Protein", value: appetizer.protein)
            }
            Spacer()
            Button {
                //order.items.append(appetizer) //bunu refactor ettim.Order'da bir kod yazdım.
                order.add(appetizer)
                isShowingDetail = false //tıkladıktan sonra ekran kapanacak
            } label: {
               // APButton(title: "$\(appetizer.price, specifier: " %.2f") - Add To Order")
                //Gerek yok bunu yapmaya onun yerine alta 2-3 satır kod yazarız.
                Text("$\(appetizer.price, specifier: " %.2f") - Add To Order")
            }
            .modifier(StandartButtonStyle())
            .padding(.bottom,30)

        }.frame(width: 300, height: 525)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(Button {
                isShowingDetail = false//Butona tıkladığımızda kapatmayı yapıyoruz böylelikle.
            } label: {
                XButton()
            }, alignment: .topTrailing)
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
    }
}
