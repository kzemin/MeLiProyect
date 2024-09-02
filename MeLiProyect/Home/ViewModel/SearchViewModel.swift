//
//  SearchViewModel.swift
//  MeLiProyect
//
//  Created by Facundo Kzemin on 29/08/2024.
//

import Foundation
import Combine

// MARK: - View Model

enum APIError: Error {
    case networkError(String)
    case decodingError(String)
}

class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var products = [Product]()
    @Published var isLoading = false
    
    private var apiService = APIService()
    private var cancellables = Set<AnyCancellable>()
    private var totalResults = 0
    
    lazy var noProductsFound: Bool = {
        return !isLoading && !products.isEmpty
    }()
    
    var isSearchTextEmpty: Bool {
        searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    func searchProducts(loadAll: Bool = false) {
        isLoading = true
        let limit = loadAll ? 50 : 10
        
        apiService.fetchProducts(query: searchText, limit: limit)
            .sink { [weak self] completion in
                self?.isLoading = false
                
                switch completion {
                case .failure(let error):
                    if let apiError = error as? APIError {
                        // Takes two possible outcomes in a failure
                        switch apiError {
                        case .networkError(let message):
                            ErrorHandler.shared.handle(AppError.network("Ocurrió un error de conexión: \(message)\nIntenta tu búsqueda nuevamente."))
                        case .decodingError(let message):
                            ErrorHandler.shared.handle(AppError.data("Ocurrió un error de datos: \(message)\nIntenta tu búsqueda nuevamente."))
                        }
                    } else {
                        // Other error
                        ErrorHandler.shared.handle(AppError.network("Ocurrió un error inesperado.\nIntenta tu búsqueda nuevamente."))
                    }
                case .finished:
                    break
                }
            } receiveValue: { [weak self] response in
                // Load the response
                self?.products = response.results
                self?.totalResults = response.paging.total
                ErrorHandler.shared.clearError()
            }
            .store(in: &cancellables)
    }
}
