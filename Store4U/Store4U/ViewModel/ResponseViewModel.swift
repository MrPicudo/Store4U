//
//  ResponseViewModel.swift
//  Store4U
//
//  Created by Jose Miguel Torres Chavez Nava on 10/09/24.
//

import SwiftUI

func loadData() async throws -> ResponseModel {
    // Obtenemos de manera segura el url de la API
    guard let path = Bundle.main.path(forResource: "infoAPI", ofType: "plist"),
          let dictionary = NSDictionary(contentsOfFile: path) as? [String: Any],
          let endpoint = dictionary["endpoint"] as? String else {
        throw APIError.missingEndpoint
    }
    
    // Creamos el objeto URL que usaremos para la llamada a la API
    guard let url = URL(string: endpoint) else {
        throw APIError.invalidURL
    }
    
    // Obtenemos los datos en formato JSON a partir de la URL
    let (data, response) = try await URLSession.shared.data(from: url)
    
    // Manejamos los posibles errores de respuesta del servidor.
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw APIError.invalidResponse
    }
    
    // Decodificamos los datos JSON a un objeto en Swift
    let decoder = JSONDecoder()
    do {
        return try decoder.decode(ResponseModel.self, from: data)
    } catch {
        throw APIError.invalidData
    }
}

// Creamos un enum para listar los posibles errores que vamos a manejar
enum APIError: Error {
    case missingEndpoint
    case invalidURL
    case invalidResponse
    case invalidData
}
