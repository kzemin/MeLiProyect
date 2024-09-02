//
//  APIManager.swift
//  MeLiProyect
//
//  Created by Facundo Kzemin on 28/08/2024.
//

import Foundation
import Combine

// MARK: - API Service

class APIService {
    private let baseURL = "https://api.mercadolibre.com"
    
    func fetchProducts(query: String, limit: Int) -> AnyPublisher<SearchResult, Error> {
        let urlString = "\(baseURL)/sites/MLA/search?q=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&limit=\(limit)"
        
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        // Return products and map to the model
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: SearchResult.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
