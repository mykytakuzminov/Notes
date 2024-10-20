//
//  ColorPickerBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 13.10.24.
//

import SwiftUI

struct ColorPickerBootcamp: View {
    
    @State var color: Color = .red
    
    var body: some View {
        ColorPicker("Select a color", selection: $color)
            .padding()
            .background(color.opacity(0.7))
            .clipShape(.rect(cornerRadius: 20))
            .padding()
            .shadow(color: color, radius: 10)
    }
}

#Preview {
    ColorPickerBootcamp()
}
