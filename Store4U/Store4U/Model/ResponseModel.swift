//
//  ResponseModel.swift
//  Store4U
//
//  Created by Jose Miguel Torres Chavez Nava on 10/09/24.
//

import SwiftUI

struct ResponseModel: Codable {
    let resultado: Resultado
}

struct Resultado: Codable {
    let productos: [Producto]
}

struct Producto: Codable, Identifiable {
    var id = UUID()
    let nombre: String
    let codigoCategoria: String
    let descuento: Bool
    let precioRegular: Int
    let urlImagenes: [String]
    let precioFinal: Double
    
    enum CodingKeys: String, CodingKey {
        case nombre
        case codigoCategoria
        case descuento
        case precioRegular
        case urlImagenes
        case precioFinal
    }
}
