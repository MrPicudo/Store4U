//
//  DiscountView.swift
//  Store4U
//
//  Created by Jose Miguel Torres Chavez Nava on 11/09/24.
//

import SwiftUI

struct DiscountView: View {
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "banknote")
                .foregroundStyle(.green)
            Text("¡En descuento!")
                .font(.footnote)
                .fontWeight(.bold)
        }
        .padding(.horizontal)
    }
}

#Preview {
    DiscountView()
}
