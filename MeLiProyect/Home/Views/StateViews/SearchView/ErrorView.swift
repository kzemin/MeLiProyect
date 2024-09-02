//
//  ErrorView.swift
//  MeLiProyect
//
//  Created by Facundo Kzemin on 30/08/2024.
//

import SwiftUI

struct ErrorView: View {
    let error: AppError
    
    var body: some View {
        VStack {
            Image(systemName: "wifi.slash")
                .resizable()
                .frame(width: 100, height: 100)
                .shadow(color: .black.opacity(0.2), radius: 10)
                .padding()
            
            Text("**\(error.localizedDescription)**")
                .font(.subheadline)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}
