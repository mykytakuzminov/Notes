//
//  DrawingGroupBootcamp.swift
//  SwiftUIDrawings
//
//  Created by Mykyta Kuzminov on 31.10.24.
//

import SwiftUI

struct ColorCyclingCircle: View {
    var amount = 0.0
    let steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps, id: \.self) { value in
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(LinearGradient(colors: [color(for: value, brigthness: 1), color(for: value, brigthness: 0.5)], startPoint: .top, endPoint: .leading), lineWidth: 2)
            }
        }
        .drawingGroup()
    }
    
    private func color(for value: Int, brigthness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brigthness)
    }
}

struct DrawingGroupBootcamp: View {
    @State private var amount = 0.0
    var body: some View {
        VStack {
            ColorCyclingCircle(amount: amount)
            
            Slider(value: $amount, in: 0...1) {
                Text("Amount")
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("1")
            }

        }
        .padding()
    }
}

#Preview {
    DrawingGroupBootcamp()
}
