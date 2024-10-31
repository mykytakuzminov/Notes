//
//  AnimatableDataBootcamp.swift
//  SwiftUIDrawings
//
//  Created by Mykyta Kuzminov on 31.10.24.
//

import SwiftUI

struct Trapezoid: Shape {
    var insetAmount: Double
    
    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

struct AnimatableDataBootcamp: View {
    @State private var insetAmount: Double = 40
    
    var body: some View {
        Trapezoid(insetAmount: insetAmount)
            .frame(width: 200, height: 100)
            .onTapGesture {
                withAnimation(.default) {
                    insetAmount = Double.random(in: 40...90)
                }
            }
    }
}

#Preview {
    AnimatableDataBootcamp()
}
