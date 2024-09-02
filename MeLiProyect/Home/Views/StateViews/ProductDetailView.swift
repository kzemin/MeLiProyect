//
//  ProductDetailView.swift
//  MeLiProyect
//
//  Created by Facundo Kzemin on 30/08/2024.
//

import SwiftUI

struct ProductDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var isLandscape: Bool {
        verticalSizeClass == .compact
    }
    
    let product: Product
    
    var body: some View {
        ScrollView {
            
            // Adaptability for landscape mode
            if isLandscape {
                HStack {
                    ProductInformationView(product: product)
                }
                .padding(.horizontal)
            } else {
                VStack(alignment: .leading) {
                    Divider()
                    
                    ProductInformationView(product: product)
                }
                .padding(.horizontal)
            }
        }
        .scrollTargetBehavior(.viewAligned)
        .navigationBarBackButtonHidden()
        .navigationTitle(product.title)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                    Text("Atrás")
                }
            }
        }
    }
}
