//
//  ButtonBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 06.10.24.
//

import SwiftUI

struct ButtonBootcamp: View {
    var body: some View {
        VStack(spacing: 10) {
            Button("Bordered") {}
                .buttonStyle(.bordered)
            
            Button("Bordered Prominent") {}
                .buttonStyle(.borderedProminent)
            
            Button("Borderless") {}
                .buttonStyle(.borderless)
            
            Button("Plain") {}
                .buttonStyle(.plain)
            
            Button("Plain") {}
                .buttonStyle(.automatic)
        }
    }
}

#Preview {
    ButtonBootcamp()
}
