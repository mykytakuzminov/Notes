//
//  GridBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 06.10.24.
//

import SwiftUI

struct GridBootcamp: View {
    
    let columns = [
        GridItem(.flexible(), spacing: 6),
        GridItem(.flexible(), spacing: 6),
        GridItem(.flexible(), spacing: 6),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 6) {
                ForEach(0..<21) { _ in
                    Rectangle()
                        .frame(height: 150)
                }
            }
        }
    }
}

#Preview {
    GridBootcamp()
}
