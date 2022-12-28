//
//  XButton.swift
//  Snacks
//
//  Created by Yavuz Güner on 25.12.2022.
//

import SwiftUI

struct XButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.black)
        }
    }
}

struct XButton_Previews: PreviewProvider {
    static var previews: some View {
        XButton().previewLayout(.sizeThatFits)
    }
}
