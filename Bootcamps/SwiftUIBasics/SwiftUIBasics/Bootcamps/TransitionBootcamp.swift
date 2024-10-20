//
//  TransitionBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 06.10.24.
//

import SwiftUI

struct TransitionBootcamp: View {
    
    @State var isPresented: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Button("Button") {
                    action()
                }
                .buttonStyle(.borderedProminent)
            }
            
            if isPresented {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 300, height: 400)
                    .frame(maxWidth: .infinity)
                    .transition(.asymmetric(
                        insertion: .move(edge: .leading),
                        removal: .move(edge: .trailing)))
                    
            }
        }
    }
    
    func action() {
        withAnimation(.default) {
            isPresented.toggle()
        }
    }
}

#Preview {
    TransitionBootcamp()
}
