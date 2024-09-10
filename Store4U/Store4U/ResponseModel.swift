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
    let categoria: String
    let nombre: String
    let urlImagenes: [String]
    let precioRegular: Int
    let precioFinal: Int
    let descuento: Bool
    
    enum CodingKeys: String, CodingKey {
        case categoria = "codigoCategoria"
        case nombre
        case urlImagenes
        case precioRegular
        case precioFinal
        case descuento
    }
}
