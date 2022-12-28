//
//  LoadingView.swift
//  Snacks
//
//  Created by Yavuz Güner on 24.12.2022.
//

import SwiftUI

struct ActivityIndicator:UIViewRepresentable{
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor.brandPrimary
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        //boş kalacak burası
    }
    
    //typealias UIViewType = UIActivityIndicatorView() Yukarıdakileri otomatik implemente ettikten sonra sileriz.
}
struct LoadingView:View{
    var body: some View{
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary))
                .scaleEffect(2)
        }
    }
}
