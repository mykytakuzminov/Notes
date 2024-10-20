//
//  BindingBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 06.10.24.
//

import SwiftUI

struct BindingBootcamp: View {
    @State var color: Color = .clear
    
    var body: some View {
        ZStack {
            
            color.opacity(0.6).ignoresSafeArea()
            
            ChooseColor(color: $color)
        }
    }
}

#Preview {
    BindingBootcamp()
}

struct ChooseColor: View {
    
    @Binding var color: Color
    
    var body: some View {
        HStack {
            Button("Gray") {
                color = .gray
            }
            .tint(.gray)
            
            Button("Blue") {
                color = .blue
            }
            .tint(.blue)
            
            Button("Pink") {
                color = .pink
            }
            .tint(.pink)
        }
        .buttonStyle(.borderedProminent)
    }
}
