//
//  ViewThatFitsBootcamp.swift
//  SwiftUIBasics
//
//  Created by Mykyta Kuzminov on 19.10.24.
//

import SwiftUI

struct ViewThatFitsBootcamp: View {
    var body: some View {
        ViewThatFits {
            HStack {
                Image(systemName: "globe")
                Text("Explore the world and discover new places..")
            }
            
            HStack {
                Image(systemName: "globe")
                Text("Explore the world.")
            }
            
            HStack {
                Image(systemName: "globe")
                Text("Explore.")
            }
        }
        .frame(width: 300, height: 300)
        .background(.regularMaterial)
    }
}

#Preview {
    ViewThatFitsBootcamp()
}
