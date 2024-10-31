//
//  AffineTransformBootcamp.swift
//  SwiftUIDrawings
//
//  Created by Mykyta Kuzminov on 31.10.24.
//

import SwiftUI

struct Flower: Shape {
    var petalOffset: CGFloat
    var petalWidth: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
            let rotation = CGAffineTransform(rotationAngle: number)
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
            let rotatedPetal = originalPetal.applying(position)
            
            path.addPath(rotatedPetal)
        }
        
        return path
    }
}

struct AffineTransformBootcamp: View {
    @State private var petalOffset: CGFloat = -20
    @State private var petalWidth: CGFloat = 50
    
    var body: some View {
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                .stroke(Color.red, style: StrokeStyle(lineWidth: 3))
            
            Slider(value: $petalOffset, in: -40...40) {
                Text("Offset")
            } minimumValueLabel: {
                Text("-40")
            } maximumValueLabel: {
                Text("40")
            }
            
            Slider(value: $petalWidth, in: -100...200) {
                Text("Width")
            } minimumValueLabel: {
                Text("-100")
            } maximumValueLabel: {
                Text("200")
            }
        }
        .padding(30)
    }
}

#Preview {
    AffineTransformBootcamp()
}
