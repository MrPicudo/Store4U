//
//  PriceView.swift
//  Store4U
//
//  Created by Jose Miguel Torres Chavez Nava on 11/09/24.
//

import SwiftUI

struct PriceView: View {
    
    var precioRegular: Int
    var descuento: Bool
    var precioFinal: Double
    
    var body: some View {
        HStack {
            Text("$\(precioRegular)")
                .font(.title)
            if descuento {
                Image(systemName: "arrow.forward")
                    .font(.title)
                    .bold()
                Text("$" + String(format: "%.0f", precioFinal))
                    .font(.title)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    PriceView(precioRegular: 3000, descuento: true, precioFinal: 2599.0)
}
