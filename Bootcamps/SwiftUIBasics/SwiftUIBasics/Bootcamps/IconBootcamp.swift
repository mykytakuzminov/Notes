//
//  IconBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 06.10.24.
//

import SwiftUI

struct IconBootcamp: View {
    var body: some View {
        Image(systemName: "sparkles")
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            //.scaledToFill()
            //.font(.largeTitle)
            //.font(.system(size: 150))
            //.foregroundStyle(.contrastBlue)
            .frame(width: 150, height: 150)
            //.clipped()
    }
}

#Preview {
    IconBootcamp()
}
