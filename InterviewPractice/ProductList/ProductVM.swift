//
//  ProductVM.swift
//  InterviewPractice
//
//  Created by Sandip Mondal on 25/06/24.
//

import Foundation

import SwiftUI

@Observable class ProductVM:Identifiable {
    
   var products : [Product] = []
    
    private let apiManager = ApiManager()
    
    func fetchProduct() async {
        do{
            products = try await apiManager.request(urlString: "https://fakestoreapi.com/products")
           // print(products)
            sahjfgh = products()
        } catch {
            print("Fetch product error: ", error)
            
        }
        
    }
    
}
