//
//  ShapeBootcamp.swift
//  SwiftUIDrawings
//
//  Created by Mykyta Kuzminov on 30.10.24.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

struct Arc: InsettableShape {
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    var insetAmount: CGFloat = 0.0
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.maxX / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct ShapeBootcamp: View {
    var body: some View {
        VStack(spacing: 40) {
            Triangle()
                .fill(LinearGradient(colors: [.purple, .blue], startPoint: .leading, endPoint: .trailing))
                .frame(width: 300, height: 300)
            
            Arc(startAngle: .degrees(0), endAngle: .degrees(210), clockwise: true)
                .strokeBorder(Color.blue, style: StrokeStyle(lineWidth: 10))
                .frame(width: 300, height: 300)
        }
    }
}

#Preview {
    ShapeBootcamp()
}
