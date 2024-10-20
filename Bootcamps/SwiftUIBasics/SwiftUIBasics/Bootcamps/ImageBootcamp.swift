//
//  ImageBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 06.10.24.
//

import SwiftUI

struct ImageBootcamp: View {
    var body: some View {
        Image("Nature")
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 200)
            //.clipped()
            .clipShape(.rect(cornerRadius: 20))
            //.clipShape(Circle())
    }
}

#Preview {
    ImageBootcamp()
}
