//
//  ScrollViewBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 06.10.24.
//

import SwiftUI

struct ScrollViewBootcamp: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(0..<10) { _ in
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(0..<10) { _ in
                                Rectangle()
                                    .frame(width: 300, height: 300)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollViewBootcamp()
}
