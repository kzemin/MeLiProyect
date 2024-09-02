//
//  ProductInformationView.swift
//  MeLiProyect
//
//  Created by Facundo Kzemin on 30/08/2024.
//

import SwiftUI

struct ProductInformationView: View {
    let product: Product
    
    var body: some View {
        AsyncImage(url: URL(string: product.thumbnail)) { image in
            image.resizable().aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
        .frame(maxWidth: .infinity, maxHeight: 300)
        
        VStack(alignment: .leading) {
            Text("$ \(String(format: "%.2f", product.price))")
                .font(.system(size: 24))
                .padding(.vertical, 3)
            
            Divider()
            
            Text("**Hay disponibles**: \(String(format: "%.0f", product.available_quantity))")
                .font(.caption)
                .padding(.vertical, 3)
            
            Text("**Condición del producto**: \(product.condition.capitalized)")
                .font(.caption)
            
            Spacer()
        }
    }
}

#Preview {
    ProductInformationView(product: Product(id: "", title: "", thumbnail: "", condition: "", price: 0, available_quantity: 0))
}
