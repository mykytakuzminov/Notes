//
//  GradientBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 06.10.24.
//

import SwiftUI

struct GradientBootcamp: View {
    var body: some View {
        Circle()
            //.fill(LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing))
            //.fill(RadialGradient(gradient: Gradient(colors: [.yellow, .orange]), center: .center, startRadius: 100, endRadius: 300))
            .fill(AngularGradient(gradient: Gradient(colors: [.yellow, .orange]), center: .bottom, angle: .degrees(90)))
    }
}

#Preview {
    GradientBootcamp()
}
