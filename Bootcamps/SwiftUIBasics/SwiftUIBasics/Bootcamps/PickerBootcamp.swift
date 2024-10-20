//
//  PickerBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 13.10.24.
//

import SwiftUI

struct PickerBootcamp: View {
    
    @State var color: Color = .red
    
    let colors: [Color] = [.red, .blue, .green, .yellow, .pink]
    
    var body: some View {
        VStack {
            Picker("Select a color", selection: $color) {
                ForEach(colors, id: \.self) { color in
                    Text(color.description.capitalized).tag(color)
                }
            }
            .pickerStyle(.palette)
            
            Picker("Select a color", selection: $color) {
                ForEach(colors, id: \.self) { color in
                    Text(color.description.capitalized).tag(color)
                }
            }
            .pickerStyle(.inline)
            
            Picker("Select a color", selection: $color) {
                ForEach(colors, id: \.self) { color in
                    Text(color.description.capitalized).tag(color)
                }
            }
            .pickerStyle(.menu)
        }
    }
}

#Preview {
    PickerBootcamp()
}
