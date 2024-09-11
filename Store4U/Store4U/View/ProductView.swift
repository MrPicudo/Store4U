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
                        // Nombre del producto
                        Text(producto.nombre)
                            .font(.title)
                            .padding(.vertical)
                        // Imagen asíncrona cargada del link obtenido de la API
                        AsyncImage(url: URL(string: producto.urlImagenes[0])) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } else if phase.error != nil {
                                Text("No se pudo cargar la imagen")
                            } else {
                                ProgressView()
                            }
                        }
                        .frame(width: 200, height: 200)
                        // Letrero de descuento
                        if producto.descuento {
                            HStack {
                                Spacer()
                                Image(systemName: "banknote")
                                    .foregroundStyle(.green)
                                Text("¡En descuento!")
                                    .font(.footnote)
                                    .fontWeight(.bold)
                            }
                            .padding(.vertical, -20)
                            .padding(.horizontal)
                        }
                        // Precio regular vs precio final
                        HStack {
                            Text("$\(producto.precioRegular)")
                                .font(.title)
                            if producto.descuento {
                                Image(systemName: "arrow.forward")
                                    .font(.title)
                                    .bold()
                                Text("$" + String(format: "%.0f", producto.precioFinal))
                                    .font(.title)
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                        // Categoria
                        HStack {
                            Text("Categoría: ")
                                .font(.title3)
                            Image(systemName: "smartphone")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.red)
                            Text(producto.codigoCategoria)
                                .font(.title3)
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    Spacer()
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
