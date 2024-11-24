//
//  VisualEffectBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 24.11.24.
//

import SwiftUI

struct VisualEffectBootcamp: View {
    var body: some View {
        ScrollView {
            ForEach(0..<50) { _ in
                Image("Nature")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .padding(.horizontal)
                    .visualEffect { content, geometry in
                        content
                            .offset(x: geometry.frame(in: .global).minY * 0.1)
                            .rotation3DEffect(.degrees(geometry.frame(in: .global).minY * 0.05), axis: (x: 0, y: 0, z: 1))
                    }
            }
        }
    }
}

#Preview {
    VisualEffectBootcamp()
}
