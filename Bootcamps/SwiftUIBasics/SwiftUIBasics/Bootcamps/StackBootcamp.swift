//
//  StackBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 06.10.24.
//

import SwiftUI

struct StackBootcamp: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            ZStack {
                Rectangle()
                    .fill(.red)
                    .frame(width: 100, height: 100)
                
                Image(systemName: "car.fill")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
            }
            
            HStack(spacing: 7) {
                
                ZStack {
                    Rectangle()
                        .fill(.orange)
                        .frame(width: 100, height: 100)
                    
                    Image(systemName: "bus.fill")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                }
                
                ZStack {
                    Rectangle()
                        .fill(.green)
                        .frame(width: 100, height: 100)
                    
                    Image(systemName: "bicycle")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                }
                
                ZStack {
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 100, height: 100)
                    
                    Image(systemName: "airplane")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                }
                
            }
            
            ZStack {
                Rectangle()
                    .fill(.yellow)
                    .frame(width: 100, height: 100)
                
                Image(systemName: "sailboat.fill")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    StackBootcamp()
}
