//
//  ContentView.swift
//  Store4U
//
//  Created by Jose Miguel Torres Chavez Nava on 09/09/24.
//

import SwiftUI

struct ProductView: View {
    
    @State private var response: ResponseModel?
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: ListView(response: $response)) {
                Text("Mostrar listado")
            }
        }
    }
}

#Preview {
    ProductView()
}
