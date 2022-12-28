//
//  APButton.swift
//  Snacks
//
//  Created by Yavuz Güner on 25.12.2022.
//

import SwiftUI

struct APButton: View {
    
    let title : LocalizedStringKey //Bunu yapmazsak specifier çalışmaz
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .background(Color.brandPrimary)
            .foregroundColor(Color.white)
            .cornerRadius(8)
    }
}

struct APButton_Previews: PreviewProvider {
    static var previews: some View {
        APButton(title: "Test Title").previewLayout(.sizeThatFits)
    }
}
