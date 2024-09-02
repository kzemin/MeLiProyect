//
//  MeLiProyectApp.swift
//  MeLiProyect
//
//  Created by Facundo Kzemin on 28/08/2024.
//

import SwiftUI

@main
struct MeLiProyectApp: App {
    
    // Modificador de tamaño y line height para NavTitle
    init() {
        let appear = UINavigationBarAppearance()
        
        let atters: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20, weight: .bold)
        ]
        
        appear.largeTitleTextAttributes = atters
        appear.titleTextAttributes = atters
        UINavigationBar.appearance().standardAppearance = appear
        UINavigationBar.appearance().compactAppearance = appear
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
