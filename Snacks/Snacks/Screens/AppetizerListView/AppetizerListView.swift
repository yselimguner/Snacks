//
//  AppetezierListView.swift
//  Snacks
//
//  Created by Yavuz Güner on 24.12.2022.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    //@State private var isShowingDetail = false //TapGesture'den sonra yazarız.
    //@State private var selectedAppetizer:Appetizer?
    //Bu iki kodu ViewModel'e published edip taşıyoruz. Kodumuz güzelleşiyor. Sonra düzeltiyoruz tabi.
    
    var body: some View {
        ZStack{
            
            NavigationView{
                List(viewModel.appetizers) { appetizer in
                    
                    AppetizerListCell(appetizer: appetizer)
                        .listRowSeparator(.visible)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            //Pass data yaparız diğer sayfaya aktarırız verileri
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("🍟 Appetizers")
                .listStyle(.plain)
                .disabled(viewModel.isShowingDetail) //List'i inactive ederiz.
            }
            
            
//            .onAppear{   //ViewwillLoad gibi düşünebiliriz..Bunun yerine alta task yaz
//                viewModel.getAppetizers()
//            }
            .task {
                viewModel.getAppetizers()
            }
            //Arka tarafı blurlaştırmak için. Tıkladığımızda veri açıldığında arka tarafı dondururuz ve yanlarını blurlaştırırız.
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail{
                AppetizerDetailView(appetizer : viewModel.selectedAppetizer ?? MockData.sampleAppetizer, isShowingDetail: $viewModel.isShowingDetail)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

struct AppetezierListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView().previewLayout(.sizeThatFits)
    }
}
