//
//  Models.swift
//  MeLiProyect
//
//  Created by Facundo Kzemin on 28/08/2024.
//

import Foundation

// MARK: - Models

struct SearchResult: Codable {
    let results: [Product]
    let paging: Paging
}

struct Paging: Codable {
    let total: Int
}

struct Product: Identifiable, Codable {
    let id: String
    let title: String
    let thumbnail: String
    let condition: String
    let price: Double
    let available_quantity: Double
}
