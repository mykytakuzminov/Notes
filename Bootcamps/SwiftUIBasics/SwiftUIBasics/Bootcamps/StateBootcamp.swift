//
//  StateBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 06.10.24.
//

import SwiftUI

struct StateBootcamp: View {
    
    @State var count: Int = 0
    
    var body: some View {
        Button {
            count += 1
        } label: {
            ZStack {
                Circle()
                    .fill(.white)
                    .shadow(radius: 10)
                
                Image(systemName: "heart.fill")
                    .font(.system(size: 50))
                    .foregroundStyle(.red)
                
                Text("\(count)")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }
            .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    StateBootcamp()
}

