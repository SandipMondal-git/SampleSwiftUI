//
//  ProductViewRow.swift
//  InterviewQuestion
//
//  Created by Sandip Mondal on 25/06/24.
//

import SwiftUI

struct ProductViewRow: View {
    let product : Product
    
    var body: some View {
        HStack(alignment: .center) {
            AsyncImage(url: URL(string: product.image ?? "")) { Image in
                Image.resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }.frame(width: 150, height: 150)
            VStack(alignment: .leading, spacing: 8) {
                Text(product.title ?? "")
                    .font(.title2)
                    .fontWeight(.medium)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                HStack {
                    Text(product.category ?? "")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                    Spacer()
                    
                    HStack {
                        Image(systemName: "star.fill")
                        Text(String(format: "%.1f", product.rating?.rate ?? 0.0))
                    }
                    .font(.subheadline)
                    .foregroundColor(Color.yellow)
                }
                
                Text(product.description ?? "")
                    .font(.footnote)
                    .lineLimit(3)
                
                HStack {
                    Text("$" + String(format: "%.1f", product.price ?? 0.00))
                        .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.gray)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Buy")
                            .font(.subheadline)
                            .padding(EdgeInsets(top: 3, leading: 15, bottom: 4, trailing: 15))
                            .background(.indigo)
                            .foregroundColor(.white)
                            .clipShape(.capsule)
                    })
                }
            }
        }
        .padding(10)
    }
}

#Preview {
    ProductViewRow(product: Product.dummy)
}
