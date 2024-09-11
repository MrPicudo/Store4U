//
//  ListView.swift
//  Store4U
//
//  Created by Jose Miguel Torres Chavez Nava on 10/09/24.
//

import SwiftUI

struct ListView: View {
    
    @Binding var response: ResponseModel?
    @Binding var selectedProduct: Producto?
    @Environment(\.presentationMode) var presentationMode // Para controlar el regreso a la vista principal
    
    var body: some View {
        VStack {
            if let response = response {
                ForEach(response.resultado.productos) { producto in
                    Button {
                        selectedProduct = producto
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack {
                            Text(producto.nombre)
                            Spacer()
                            Text("\(producto.precioRegular)")
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .task {
            do {
                response = try await loadData()
            } catch APIError.missingEndpoint {
                print("No se pudo obtener el endpoint")
            } catch APIError.invalidURL {
                print("URL inválido")
            } catch APIError.invalidResponse {
                print("Respuesta del servidor fallida")
            } catch APIError.invalidData {
                print("No se pudo obtener la información")
            } catch {
                print("Error desconocido")
            }
        }
    }
}

#Preview {
    ListView(response: .constant(ResponseModel(resultado: Resultado(productos: [Producto(nombre: "iPhone 16 Pro", codigoCategoria: "Smartphones", descuento: false, precioRegular: 32000, urlImagenes: ["", ""], precioFinal: 32000.0)]))), selectedProduct: .constant(Producto(nombre: "iPhone 16 Pro", codigoCategoria: "Smartphones", descuento: false, precioRegular: 32000, urlImagenes: ["", ""], precioFinal: 32000.0)))
}
