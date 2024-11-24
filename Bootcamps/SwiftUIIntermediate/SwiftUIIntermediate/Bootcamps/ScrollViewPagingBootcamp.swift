//
//  ScrollViewPagingBootcamp.swift
//  SwiftUIIntermediate
//
//  Created by Mykyta Kuzminov on 24.11.24.
//

import SwiftUI

struct ScrollViewPagingBootcamp: View {
    
    @State private var currentPosition: Int? = 1
    
    var body: some View {
        ScrollView {
            Button("Scroll to 10") {
                currentPosition = 10
            }
            
            ForEach(1..<20) { index in
                ZStack {
                    Rectangle()
                        .frame(height: 600)
                        .clipShape(.rect(cornerRadius: 10))
                    
                    Text("\(index)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                }
                .id(index)
                .containerRelativeFrame(.vertical, alignment: .center)
                .scrollTransition { content, phase in
                    content
                        .opacity(phase.isIdentity ? 1 : 0)
                        .offset(x: phase.isIdentity ? 0 : 100)
                }
                .padding(.horizontal)
            }
        }
        .scrollIndicators(.hidden)
        .scrollTargetLayout()
        //.scrollTargetBehavior(.paging)
        .scrollBounceBehavior(.basedOnSize)
        .scrollPosition(id: $currentPosition, anchor: .center)
        .animation(.default, value: currentPosition)
    }
}

#Preview {
    ScrollViewPagingBootcamp()
}
