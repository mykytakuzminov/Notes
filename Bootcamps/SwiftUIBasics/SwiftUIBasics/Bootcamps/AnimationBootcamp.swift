//
//  AnimationBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 06.10.24.
//

import SwiftUI

struct AnimationBootcamp: View {
    
    @State var isAnimated: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "heart.fill")
                .font(.largeTitle)
                .foregroundStyle(isAnimated ? .pink : .clear)
                .scaleEffect(isAnimated ? 1.7 : 1.0)
                .symbolEffect(.bounce, value: isAnimated)
            
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 20)
                .frame(width: isAnimated ? 200 : 100)
                .frame(height: isAnimated ? 200 : 100)
                .rotationEffect(.degrees(isAnimated ? 0 : 360))
                .foregroundStyle(isAnimated ? .red : .green)
                .offset(y: isAnimated ? 100 : -100)
                .onTapGesture { action() }
        }
    }
    
    func action() {
        withAnimation(.default) {
            isAnimated.toggle()
        }
    }
}

#Preview {
    AnimationBootcamp()
}
