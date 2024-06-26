//
//  ProductView.swift
//  InterviewQuestion
//
//  Created by Sandip Mondal on 25/06/24.
//

import SwiftUI

struct ProductView: View {
    var puoductVM = ProductVM()
    @State var selectedData: Product
    
    var body: some View {
        NavigationView{
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                List (puoductVM.products) { product in
                    ProductViewRow(product: product)
                }
                .listStyle(.plain)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text("Products")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .bold()
                                .foregroundColor(.white)
                        }
                    }
                }
               
            }
           
        }
        .task {
            await puoductVM.fetchProduct()
        }
    }
}

#Preview {
    ProductView()
}
