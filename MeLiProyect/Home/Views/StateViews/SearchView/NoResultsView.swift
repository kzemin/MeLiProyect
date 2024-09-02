//
//  NoResultsView.swift
//  MeLiProyect
//
//  Created by Facundo Kzemin on 30/08/2024.
//

import SwiftUI

struct NoResultsView: View {
    var body: some View {
        VStack(spacing: 25) {
            Spacer()
            
            Image(systemName: "exclamationmark.magnifyingglass")
                .resizable()
                .frame(width: 100, height: 100)
                .shadow(color: .black.opacity(0.2), radius: 10)
                .padding()
            
            Text("No encontramos resultados para tu búsqueda.")
                .font(.subheadline.bold())
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding(.horizontal, 50)
    }
}

#Preview {
    NoResultsView()
}
