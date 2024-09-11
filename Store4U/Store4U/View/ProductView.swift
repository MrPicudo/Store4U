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
                    ScrollView {
                        // Detalle de producto seleccionado.
                        if let producto = selectedProduct {
                            // Nombre del producto
                            Text(producto.nombre)
                                .font(.title)
                                .padding()
                            // Carrusel de imágenes asíncronas del producto.
                            TabView {
                                ForEach(producto.urlImagenes, id: \.self) { url in
                                    AsyncImageView(width: 200, height: 200, url: url)
                                }
                            }
                            .tabViewStyle(PageTabViewStyle())
                            .frame(height: 300)
                            // Letrero de descuento
                            if producto.descuento {
                                DiscountView()
                            }
                            // Precio regular vs precio final
                            PriceView(precioRegular: producto.precioRegular, descuento: producto.descuento, precioFinal: producto.precioFinal)
                            // Categoria
                            CategoryView(codigoCategoria: producto.codigoCategoria)
                        }
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
