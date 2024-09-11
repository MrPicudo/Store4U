//
//  CategoryView.swift
//  Store4U
//
//  Created by Jose Miguel Torres Chavez Nava on 11/09/24.
//

import SwiftUI

struct CategoryView: View {
    
    var codigoCategoria: String
    
    var symbol: String {
        switch codigoCategoria {
        case "C":
            return "sparkles.tv"
        case "TL":
            return "iphone.sizes"
        case "MA":
            return "steeringwheel.and.key"
        default:
            return "circle"
        }
    }
    
    var color: Color {
        switch codigoCategoria {
        case "C":
            return .red
        case "TL":
            return .purple
        case "MA":
            return .blue
        default:
            return .black
        }
    }
    
    var body: some View {
        HStack {
            Text("Categoría: ")
                .font(.title3)
            Image(systemName: symbol)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundStyle(color)
            Text(codigoCategoria)
                .font(.title3)
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    CategoryView(codigoCategoria: "MA")
}
