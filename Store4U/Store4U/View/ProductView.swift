//
//  ContentView.swift
//  Store4U
//
//  Created by Jose Miguel Torres Chavez Nava on 09/09/24.
//

import SwiftUI

struct ProductView: View {
    
    @State private var response: ResponseModel?
    @State private var selectedProduct: Producto?
    
    var body: some View {
        NavigationStack {
            VStack {
                if response == nil {
                    Spacer()
                } else {
                    // Detalle de producto seleccionado.
                    if let producto = selectedProduct {
                        Text("Producto seleccionado: \(producto.nombre)")
                        Text("Precio: \(producto.precioRegular)")
                    }
                }
                NavigationLink(destination: ListView(response: $response, selectedProduct: $selectedProduct)) {
                    Text("Mostrar listado")
                        .tint(.white)
                        .font(.title3)
                        .padding()
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            }
        }
    }
}

#Preview {
    ProductView()
}
