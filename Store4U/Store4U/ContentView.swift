//
//  ContentView.swift
//  Store4U
//
//  Created by Jose Miguel Torres Chavez Nava on 09/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var response: ResponseModel?
    
    var body: some View {
        VStack {
            if let response = response {
                Text(response.resultado.productos[0].nombre)
            }
        }
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
    ContentView()
}
