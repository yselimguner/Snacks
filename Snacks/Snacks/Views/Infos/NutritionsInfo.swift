//
//  NutritionsInfo.swift
//  Snacks
//
//  Created by Yavuz Güner on 25.12.2022.
//

import SwiftUI

struct NutritionsInfo: View {
    
    var title:String
    var value:Int
    
    var body: some View {
        VStack(spacing: 5){
            Text(title)
                .bold()
                .font(.caption)
            Text("\(value) g")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

struct NutritionsInfo_Previews: PreviewProvider {
    static var previews: some View {
        NutritionsInfo(title: "Protein", value: MockData.sampleAppetizer.protein)
    }
}
