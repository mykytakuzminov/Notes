//
//  MagnificationGestureBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 12.11.24.
//

import SwiftUI

struct MagnificationGestureBootcamp: View {
    
    @State private var currentAmount: CGFloat = 0
    
    var body: some View {
        Rectangle()
            .frame(width: 300, height: 300)
            .scaleEffect(1 + currentAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        currentAmount = value - 1
                    }
                    .onEnded { value in
                        withAnimation(.easeInOut) {
                            currentAmount = 0
                        }
                    }
            )
    }
}

#Preview {
    MagnificationGestureBootcamp()
}
