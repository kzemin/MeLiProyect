//
//  EmptyStateView.swift
//  MeLiProyect
//
//  Created by Facundo Kzemin on 30/08/2024.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            
            Text("👋")
                .font(.system(size: 80))
                .padding(.vertical)
            
            Text("¡Realiza una búsqueda en el sistema de Mercado Libre!")
                .font(.callout)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
    }
}

#Preview {
    EmptyStateView()
}
