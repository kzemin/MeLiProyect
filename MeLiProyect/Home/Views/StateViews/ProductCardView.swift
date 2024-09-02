//
//  ProductCardView.swift
//  MeLiProyect
//
//  Created by Facundo Kzemin on 30/08/2024.
//

import SwiftUI

struct ProductCardView: View {
    var product: Product
    
    var body: some View {
        NavigationLink(destination: ProductDetailView(product: product)) {
            ZStack(alignment: .topTrailing) {
                ZStack(alignment: .bottom) {
                    
                    AsyncImage(url: URL(string: product.thumbnail)) { image in
                        image
                            .resizable().cornerRadius(20).frame(width: 100).frame(maxHeight: 150).scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    
                    VStack(alignment: .leading) {
                        Text(product.title)
                            .font(.system(size: 14))
                            .tint(.primary)
                            .lineLimit(1)
                            .bold()
                        
                        Text("$ \(String(format: "%.2f", product.price))")
                            .font(.system(size: 12))
                            .tint(.primary)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .frame(width: 170, alignment: .leading)
                    .background(.thinMaterial)
                    .cornerRadius(20)
                    .offset(y: 10)
                }
                .frame(width: 180, height: 200)
                .shadow(radius: 3)
                
                Image(systemName: "info")
                    .padding(10)
                    .foregroundStyle(.white)
                    .background(.black)
                    .cornerRadius(50)
            }
        }
    }
}

#Preview {
    ProductCardView(product: Product(id: "", title: "", thumbnail: "", condition: "", price: 0, available_quantity: 0))
}
