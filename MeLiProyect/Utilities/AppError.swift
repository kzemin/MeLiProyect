//
//  AppError.swift
//  MeLiProyect
//
//  Created by Facundo Kzemin on 30/08/2024.
//

import SwiftUI
import os

// MARK: - Error Handling

enum AppError: Error, Identifiable {
    case network(String)
    case data(String)
    
    var id: String { localizedDescription }
    
    var localizedDescription: String {
        // Two outcomes for an error
        switch self {
        case .network(let message): return "Error de conexión: \(message)"
        case .data(let message): return "Error de datos: \(message)"
        }
    }
    
    // Return custom images for each
    var imageName: String {
        switch self {
        case .network: return "wifi.slash"
        case .data: return "not-found"
        }
    }
}

final class ErrorHandler: ObservableObject {
    static let shared = ErrorHandler()
    private let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "ErrorHandler")
    
    @Published var currentError: AppError?
    
    // Logs for error handling
    func handle(_ error: Error) {
        logger.error("\(error.localizedDescription)")
        
        if let appError = error as? AppError {
            DispatchQueue.main.async {
                self.currentError = appError
            }
        } else {
            logger.fault("Error: \(error)")
        }
    }
    
    func clearError() {
        currentError = nil
    }
}
