//
//  ShapeBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 06.10.24.
//

import SwiftUI

struct ShapeBootcamp: View {
    var body: some View {
        //Circle()
        //Ellipse()
        //Capsule()
        //Rectangle()
        RoundedRectangle(cornerRadius: 30)
            //.trim(from: 0.2, to: 1.0)
            .fill(.green)
            //.stroke()
            //.stroke(.yellow, lineWidth: 10)
            //.stroke(.purple, style: StrokeStyle(lineWidth: 10, lineCap: .butt, lineJoin: .round, dash: [30]))
            //.foregroundStyle(.pink)
    }
}

#Preview {
    ShapeBootcamp()
}
