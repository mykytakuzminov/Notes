//
//  TapGestureBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 16.10.24.
//

import SwiftUI

struct TapGestureBootcamp: View {
    
    @State private var isAnimated: Bool = false
    
    var body: some View {
        Image(systemName: "airplane")
            .font(.system(size: isAnimated ? 100 : 30))
            .foregroundStyle(isAnimated ? .orange : .yellow)
            .rotationEffect(.degrees(isAnimated ? 270 : 90))
            .offset(y: isAnimated ? 200 : -200)
            .onTapGesture {
                withAnimation(.snappy) {
                    isAnimated.toggle()
                }
            }
    }
}

#Preview {
    TapGestureBootcamp()
}
