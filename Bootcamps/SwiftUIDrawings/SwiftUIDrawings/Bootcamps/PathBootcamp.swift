//
//  PathBootcamp.swift
//  SwiftUIDrawings
//
//  Created by Mykyta Kuzminov on 30.10.24.
//

import SwiftUI

struct PathBootcamp: View {
    var body: some View {
        VStack {
            Path { path in
                path.move(to: CGPoint(x: 200, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 300))
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.closeSubpath()
            }
            .stroke(Color.purple, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            
            Path { path in
                path.move(to: CGPoint(x: 100, y: 100))
                path.addLine(to: CGPoint(x: 300, y: 100))
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.addLine(to: CGPoint(x: 100, y: 300))
                path.closeSubpath()
            }
            .fill(Color.green)
        }
    }
}

#Preview {
    PathBootcamp()
}
