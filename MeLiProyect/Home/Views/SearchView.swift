//
//  SearchView.swift
//  MeLiProyect
//
//  Created by Facundo Kzemin on 28/08/2024.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @StateObject private var errorHandler = ErrorHandler.shared
    @State private var refreshedSearch = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Buscar productos...", text: $viewModel.searchText)
                    .padding(.horizontal)
                    .textFieldStyle(.roundedBorder)
                    .shadow(color: .gray.opacity(0.2), radius: 10)
                    .onSubmit {
                        viewModel.searchProducts()
                        refreshedSearch = false
                    }
                
                // Views for each conditional
                if let error = errorHandler.currentError {
                    ErrorView(error: error)
                }
                if viewModel.products.isEmpty && viewModel.isSearchTextEmpty {
                    EmptyStateView()
                        .padding(.bottom, 50)
                }
                else if viewModel.isLoading && !refreshedSearch {
                    ProgressView()
                        .padding(.vertical, 50)
                }
                else if viewModel.noProductsFound || (viewModel.isSearchTextEmpty && viewModel.searchText != "") {
                    NoResultsView()
                }
                else if errorHandler.currentError == nil {
                    ProductGridView(viewModel: viewModel)
                }
                
                Spacer()
                
                if viewModel.products.count == 10 {
                    LoadMoreButton(isLoading: viewModel.isLoading) {
                        viewModel.searchProducts(loadAll: true)
                        refreshedSearch = true
                    }
                }
            }
            .navigationTitle("Bienvenido, Gonzalo")
        }
        .scrollTargetBehavior(.viewAligned)
        .contentMargins(5, for: .scrollContent)
    }
}

struct LoadMoreButton: View {
    let isLoading: Bool
    let action: () -> Void
    
    var body: some View {
        Button(isLoading ? "Cargando todos los resultados..." : "Ver todos", action: action)
            .disabled(isLoading)
            .padding()
    }
}
