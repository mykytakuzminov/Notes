//
//  ColorBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 06.10.24.
//

import SwiftUI

struct ColorBootcamp: View {
    var body: some View {
        Circle()
            //.fill(.blue)
            //.fill(Color(UIColor.green))
            //.fill(Color(UIColor.secondarySystemBackground))
            .fill(.contrastBlue)
            //.shadow(radius: 10)
            .shadow(color: .blue, radius: 30, x: 0, y: 10)
    }
}

#Preview {
    ColorBootcamp()
}
