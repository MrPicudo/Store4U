//
//  AsyncImageView.swift
//  Store4U
//
//  Created by Jose Miguel Torres Chavez Nava on 11/09/24.
//

import SwiftUI

struct AsyncImageView: View {
    
    var width: CGFloat
    var height: CGFloat
    var url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
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
        .frame(width: width, height: height)
    }
}

#Preview {
    AsyncImageView(width: 100, height: 100, url: "")
}
