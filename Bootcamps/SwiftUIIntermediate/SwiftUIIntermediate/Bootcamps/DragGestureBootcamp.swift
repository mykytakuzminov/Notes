//
//  DragGestureBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 12.11.24.
//

import SwiftUI

struct DragGestureBootcamp: View {
    
    @State private var offset: CGSize = .zero
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 500)
                .offset(offset)
                .rotationEffect(getRotation(width: width))
                .scaleEffect(getScale(width: width))
                .shadow(color: getColor(width: width).opacity(getOpacity(width: width)), radius: 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            offset = value.translation
                        }
                        .onEnded { value in
                            withAnimation(.easeInOut) {
                                offset = .zero
                            }
                        }
                )
        }
    }
    
    private func getRotation(width: CGFloat) -> Angle {
        let maxAmount = width / 2
        let currentAmount = offset.width
        let percentage = currentAmount / maxAmount
        let rotation = Angle(degrees: percentage * 10)
        return rotation
    }
    
    private func getScale(width: CGFloat) -> CGFloat {
        let maxAmount = width / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / maxAmount
        let scale = 1 - min(percentage, 0.2) * 0.5
        return scale
    }
    
    private func getOpacity(width: CGFloat) -> Double {
        let maxAmount = width / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / maxAmount
        let opacity = min(percentage * 1.5, 1)
        return opacity
    }
    
    private func getColor(width: CGFloat) -> Color {
        let currentAmount = offset.width
        var color = Color.clear
        
        if currentAmount > 0 {
            color = .green
        } else if currentAmount < 0 {
            color = .orange
        } else {
            color = .clear
        }
        
        return color
    }
}

#Preview {
    DragGestureBootcamp()
}
