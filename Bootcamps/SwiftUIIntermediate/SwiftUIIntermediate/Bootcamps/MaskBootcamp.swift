//
//  MaskBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 14.11.24.
//

import SwiftUI

struct MaskBootcamp: View {
    
    @State private var selectedRating: Int = 5
    
    var body: some View {
        starsLayer
            .overlay {
                GeometryReader { geo in
                    Rectangle()
                        .fill(Color.yellow)
                        .frame(width: getRating(geo: geo))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .mask(starsLayer)
                }
                .allowsHitTesting(false)
            }
    }
}

#Preview {
    MaskBootcamp()
}

extension MaskBootcamp {
    
    private var starsLayer: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(Color.gray)
                    .frame(width: 50, height: 50)
                    .onTapGesture {
                        withAnimation(.default) {
                            selectedRating = index
                        }
                    }
                    .frame(maxWidth: .infinity)
            }
        }
    }
    
    private func getRating(geo: GeometryProxy) -> CGFloat {
        return CGFloat(selectedRating) / 5 * geo.size.width
    }
}
