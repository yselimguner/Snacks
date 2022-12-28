//
//  CustomModifiers.swift
//  Snacks
//
//  Created by Yavuz Güner on 27.12.2022.
//

import SwiftUI

struct StandartButtonStyle:ViewModifier{
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}



//Yukarıdakini çağıracaksak .modifier(StandartButtonStyle()) diye çağırmamız lazım. Aşağıdakinde direkt çağırırsın.
extension View{
    func standartButtonStyle() -> some View{
        self.modifier(StandartButtonStyle())
    }
}
