//
//  RotationGestureBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 12.11.24.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    
    @State private var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Rectangle()
            .foregroundStyle(getColor())
            .frame(width: 300, height: 300)
            .rotationEffect(angle)
            .gesture(
                RotateGesture()
                    .onChanged { value in
                        withAnimation(.easeInOut) {
                            angle = value.rotation
                        }
                    }
                    .onEnded { value in
                        withAnimation(.easeInOut) {
                            angle = Angle(degrees: 0)
                        }
                    }
            )
    }
    
    private func getColor() -> Color {
        if angle > Angle(degrees: 100) {
            return .red
        } else if angle < Angle(degrees: -100) {
            return .purple
        } else {
            return .green
        }
    }
}

#Preview {
    RotationGestureBootcamp()
}
