//
//  SpecialEffectsBootcamp.swift
//  SwiftUIDrawings
//
//  Created by Mykyta Kuzminov on 31.10.24.
//

import SwiftUI

struct SpecialEffectsBootcamp: View {
    @State private var amount = 0.0
    
    var body: some View {
        VStack {
            HStack {
                Image("Pattern")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .colorMultiply(.red)
                
                Image("Pattern")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .saturation(amount)
                    .blur(radius: (1 - amount) * 2)
                    
            }
            .padding(.bottom, 30)
            
            ZStack {
                Circle()
                    .fill(Color(red: 1, green: 0, blue: 0))
                    .frame(width: 150 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(red: 0, green: 1, blue: 0))
                    .frame(width: 150 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(red: 0, green: 0, blue: 1))
                    .frame(width: 150 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount) {}
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

#Preview {
    SpecialEffectsBootcamp()
}
