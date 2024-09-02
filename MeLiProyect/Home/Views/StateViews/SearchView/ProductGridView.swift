//
//  ProductGridView.swift
//  MeLiProyect
//
//  Created by Facundo Kzemin on 01/09/2024.
//

import SwiftUI

struct ProductGridView: View {
    var viewModel: SearchViewModel
    var columns = [GridItem(.adaptive(minimum: 140), spacing: 15)]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.products) { product in
                    ProductCardView(product: product)
                }
            }
            .padding()
            .scrollTargetLayout()
        }
    }
}

#Preview {
    ProductGridView(viewModel: SearchViewModel())
}
